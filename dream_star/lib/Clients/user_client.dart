import 'package:dream_star/Models/app_side.dart';

class UserClient {
  final isAuth = false;
  final List<String> _children = ["Динар", "Дамир", "Аня", "Арсений"];
  AppSide _role = AppSide.parent;

  void setUserRole(bool isParent) {
    _role = isParent ? AppSide.parent : AppSide.child;
  }

  AppSide getUserRole() => _role;

  List<String> getChildrenList() => _children;
}