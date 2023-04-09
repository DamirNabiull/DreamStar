import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ConnectionClient extends Notifier<bool> {
  ConnectionClient() {
    if (!kIsWeb) {
      final internetProvider = InternetConnectionChecker.createInstance(
        checkTimeout: const Duration(seconds: 2),
        checkInterval: const Duration(milliseconds: 400),
      );

      final StreamSubscription<InternetConnectionStatus> _ =
          internetProvider.onStatusChange.listen(
        (InternetConnectionStatus status) {
          // print("CHECK");
          switch (status) {
            case InternetConnectionStatus.connected:
              state = true;
              break;
            case InternetConnectionStatus.disconnected:
              state = false;
              break;
          }
        },
      );

      Connectivity().onConnectivityChanged.listen((result) async {
        state = await InternetConnectionChecker().hasConnection;
      });
    } else {
      Connectivity().onConnectivityChanged.listen((result) async {
        if (result == ConnectivityResult.none) {
          state = false;
        } else {
          state = true;
        }
      });
    }
  }

  @override
  bool build() {
    return true;
  }
}
