import 'package:dream_star/Clients/firestore_client.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/user_dto.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserClient {
  bool isAuth = false;
  AppSide? _role;
  UserDTO? _userInfo;
  String? _userId;

  final container = ProviderContainer();
  late final FireStoreClient _fireStoreClient = container.read(fireStoreProvider);

  UserClient() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _setAuthInfo(true, user.uid);
      } else {
        _role = null;
        _userInfo = null;
        _userId = null;
        isAuth = false;
      }
    });
  }

  Stream<User?> authState = FirebaseAuth.instance.authStateChanges();

  Future parentSignIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future childSignIn(String token) async {

  }

  AppSide getUserRole() => _role!;

  List<String> getChildrenList() => _userInfo!.children!;

  void setUserRole(bool isParent) {
    _role = isParent ? AppSide.parent : AppSide.child;
  }

  void _setAuthInfo(bool authStatus, String id) {
    isAuth = authStatus;
    _userId = id;
    _getUserInfo();
  }

  void _getUserInfo() {
    var user = _fireStoreClient.getUser(_userId!);
    user.then((val) {
      if (val != null) {
        _userInfo = val;
        setUserRole(_userInfo!.isParent);
      }
    });
  }
}
