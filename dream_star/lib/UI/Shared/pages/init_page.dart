import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/Shared/Login/wait_login_screen.dart';
import 'package:dream_star/UI/Shared/WithBottomBar/bottom_bar_wrapper.dart';
import 'package:dream_star/UI/Shared/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitPage extends ConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: ref.read(userProvider).authState(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw Exception(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return const BottomBarWrapper();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const WaitLoginScreen();
        }
        return const MainHomeScreen();
      },
    );
  }
}
