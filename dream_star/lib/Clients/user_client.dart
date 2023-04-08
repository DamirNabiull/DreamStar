import 'package:dream_star/Models/app_side.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserClient {
  final container = ProviderContainer();

  final isAuth = false;
  var _role = AppSide.parent;

  void setUserRole(bool isParent) {
    _role = isParent ? AppSide.parent : AppSide.child;
  }

  AppSide getUserRole() => _role;
}