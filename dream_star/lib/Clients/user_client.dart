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
  bool isLogin = false;
  AppSide? role;
  UserDTO? _userInfo;
  String? _userId;
  String? childToken;
  List<String> childTokens = [];
  List<String> _childNames = [];
  final List<int> _stars = [];

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

  // SIGN IN PART

  Future signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    _userId = _firebaseAuth.currentUser!.uid;
    // _setAuthInfo();
  }

  Future childSignIn(String token) async {
    childToken = token;
    Map<String, String> data =
        (await _fireStoreClient.getIdAndPassByToken(token))!;

    var email = '$token@child.dreamstar.mail';
    var password = data['password']!;

    await signIn(email, password);
  }

  // DATA FUNCTIONS

  String getUserName() {
    return _userInfo!.name;
  }

  String getUserNameSurname() {
    return '${_userInfo!.name} ${_userInfo!.surname}';
  }

  List<int> getParentStars() {
    return _stars;
  }

  int getChildStars() {
    return _userInfo!.stars!;
  }

  List<String> getChildrenNamesList() {
    return _childNames;
  }

  String getUserId() {
    return _userId!;
  }

  Future updateAuthInfo() async {
    await _getUserInfo();
  }

  Future _setChildrenTokensList(bool isParent) async {
    if (!isParent) {
      return;
    }

    childTokens = [];
    var ids = childrenList();
    for (var id in ids) {
      String? token = await _fireStoreClient.getTokenById(id);
      childTokens.add(token!);
    }
  }

  Future _setChildrenNamesList(bool isParent) async {
    if (!isParent) {
      return;
    }

    _childNames = [];
    var ids = childrenList();
    for (var id in ids) {
      UserDTO? userDTO = await _fireStoreClient.getUser(id);
      _childNames.add(userDTO!.name);
    }
  }

  void _setUserRole(bool isParent) {
    role = isParent ? AppSide.parent : AppSide.child;
  }

  Future _getUserInfo() async {
    var user = await _fireStoreClient.getUser(_userId!);

    _userInfo = user;
    _setUserRole(_userInfo!.isParent);
    await _setChildrenNamesList(_userInfo!.isParent);
    await _setChildrenTokensList(_userInfo!.isParent);
    isLogin = true;
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
        await _firebaseAuth.createUserWithEmailAndPassword(
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
    // print('Token generation');

    var token = _generateToken();
    while (!_fireStoreClient.isTokenFree(token)) {
      token = _generateToken();
    }

    // print(token);

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
    _fireStoreClient.createToken(token, id, password);

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

  // SIGN OUT

  Future signOut() async {
    isLogin = false;
    await _firebaseAuth.signOut();
  }
}
