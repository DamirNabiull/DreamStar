import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/dream_info.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/ChildSide/dream/dream_creation_screen.dart';
import 'package:dream_star/UI/Components/top_app_bar.dart';
import 'package:dream_star/UI/Shared/Dreams/dream_list_screen.dart';
import 'package:dream_star/UI/Shared/Tasks/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class DreamsMainScreen extends ConsumerWidget {
  const DreamsMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TopAppBar(
          context,
          'dreams-screen-title'.i18n(),
          [
            'dreams-progress-title'.i18n(),
            'dreams-review-title'.i18n(),
            'dreams-passed-title'.i18n()
          ],
          ref.read(userProvider).role!,
          AppSide.child,
          const DreamCreationScreen(),
        ),
        body: TabBarView(
          children: [
            DreamListScreen(
              ref.read(userProvider).role!,
              const [DreamStatus.approved, DreamStatus.wait],
            ),
            DreamListScreen(
              ref.read(userProvider).role!,
              const [DreamStatus.review],
            ),
            DreamListScreen(
              ref.read(userProvider).role!,
              const [DreamStatus.complete],
            )
          ],
        ),
      ),
    );
  }
}
