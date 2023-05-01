import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginStatusClient extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void update() {
    state = true;
  }
}
