import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/Shared/Connection/no_connection_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenWrapper extends ConsumerWidget {
  final Widget child;

  const ScreenWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(connectionProvider) ? child : const NoConnectionScreen();
  }
}