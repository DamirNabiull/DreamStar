import 'package:dream_star/Models/app_side.dart';

class UserClient {
  final isAuth = false;
  var _role = AppSide.parent;

  void setUserRole(bool isParent) {
    _role = isParent ? AppSide.parent : AppSide.child;
  }

  AppSide getUserRole() => _role;
}