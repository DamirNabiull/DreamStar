import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/dream_info.dart';
import 'package:dream_star/UI/Components/dream_card.dart';
import 'package:dream_star/UI/Shared/NoChildAdded/no_child_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DreamListScreen extends ConsumerWidget {
  final List<DreamStatus> _dreamStatusList;
  final AppSide _appSide;

  const DreamListScreen(this._appSide, this._dreamStatusList, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dreamsStream = ref.watch(fireStoreProvider).getDreams(
          ref.read(userProvider).childrenList(),
          _dreamStatusList,
        );
    return Scaffold(
      body: StreamBuilder(
        stream: dreamsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error occurred");
          } else if (snapshot.hasData) {
            final dreams = snapshot.data!;
            return SizedBox(
              height: double.infinity,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 12),
                shrinkWrap: true,
                itemCount: dreams.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DreamCard(appSide: _appSide, dreamInfo: dreams[index])
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const NoChildScreen();
          }
        },
      ),
    );
  }
}
