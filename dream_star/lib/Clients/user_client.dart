import 'package:dream_star/Clients/firestore_client.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/user_dto.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserClient {
  bool isAuth = false;
  AppSide? role;
  UserDTO? _userInfo;
  String? _userId;

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
}
