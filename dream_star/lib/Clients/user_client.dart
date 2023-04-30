import 'dart:math';

import 'package:dream_star/Clients/firestore_client.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/user_dto.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_password_generator/random_password_generator.dart';

class UserClient {
  bool isAuth = false;
  AppSide? role;
  UserDTO? _userInfo;
  String? _userId;

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
        isAuth = false;
      }
    });
  }

  Stream<User?> authState() => _firebaseAuth.authStateChanges();

  Future parentSignIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _setAuthInfo(true, _firebaseAuth.currentUser!.uid);
  }

  Future childSignIn(String token) async {}

  List<String> getChildrenList() => _userInfo!.children!;

  void setUserRole(bool isParent) {
    role = isParent ? AppSide.parent : AppSide.child;
  }

  Future _setAuthInfo(bool authStatus, String id) async {
    isAuth = authStatus;
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

  // CHILD TOKEN PART
  String generateToken() {
    return String.fromCharCodes(Iterable.generate(
        5, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  void generateChildAccount() {
    var token = generateToken();
    var mail = token + '@child.dreamstar.mail';
    var password = _passGen.randomPassword(
      letters: true,
      uppercase: true,
      numbers: true,
      specialChar: true,
      passwordLength: 16,
    );

    print(token);
    print(mail);
    print(password);
  }
}
