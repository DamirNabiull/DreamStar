import 'dart:math';

import 'package:dream_star/Clients/firestore_client.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/user_dto.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_password_generator/random_password_generator.dart';

class UserClient {
  AppSide? role;
  UserDTO? _userInfo;
  String? _userId;
  String? childToken;

  final _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-';
  final _rnd = Random();
  final _passGen = RandomPasswordGenerator();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final container = ProviderContainer();
  late final FireStoreClient _fireStoreClient =
      container.read(fireStoreProvider);

  UserClient() {
    _firebaseAuth.authStateChanges().listen((User? user) async {
      if (user == null) {
        role = null;
        _userInfo = null;
        _userId = null;
      } else {
        _userId = user.uid;
      }
    });
  }

  List<String> childrenList() {
    if (_userInfo!.isParent) {
      return _userInfo!.children!;
    }
    return [_userId!];
  }

  Stream<User?> authState() => _firebaseAuth.authStateChanges();

  Future parentSignIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    setAuthInfo(_firebaseAuth.currentUser!.uid);
  }

  Future childSignIn(String token) async {
    childToken = token;
  }

  List<String> getChildrenList() => _userInfo!.children!;

  void setUserRole(bool isParent) {
    role = isParent ? AppSide.parent : AppSide.child;
  }

  Future updateAuthInfo() async {
    await setAuthInfo(_userId!);
  }

  Future setAuthInfo(String id) async {
    _userId = id;
    await _getUserInfo();
  }

  Future _getUserInfo() async {
    var user = await _fireStoreClient.getUser(_userId!);

    if (user != null) {
      _userInfo = user;
      setUserRole(_userInfo!.isParent);
    }
  }

  Future _saveDataAboutUser(
      String name, String surname, bool isParent, String id) async {
    UserDTO dto;
    if (isParent) {
      dto = UserDTO(name, surname, 'empty', isParent, []);
    } else {
      dto = UserDTO(name, surname, 'empty', isParent, null, 0);
    }
    _fireStoreClient.createUser(dto, id);
  }

  // PARENT REGISTER

  Future createParentAccount(
      String name, String surname, String mail, String password) async {
    String id = await _registerParent(mail, password);
    await _saveDataAboutUser(name, surname, true, id);
  }

  Future<String> _registerParent(String email, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user!.uid;
  }

  // CHILD TOKEN PART
  String _generateToken() {
    return String.fromCharCodes(Iterable.generate(
        5, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<String> createChildAccount(String name, String surname) async {
    var token = _generateToken();
    var mail = '$token@child.dreamstar.mail';
    var password = _passGen.randomPassword(
      letters: true,
      uppercase: true,
      numbers: true,
      specialChar: true,
      passwordLength: 16,
    );

    String id = await _registerChild(mail, password);
    _userInfo!.children!.add(id);

    await _saveDataAboutUser(name, surname, false, id);

    return token;
  }

  Future<String> _registerChild(String email, String password) async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);

    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(email: email, password: password);

    await app.delete();

    return userCredential.user!.uid;
  }
}
