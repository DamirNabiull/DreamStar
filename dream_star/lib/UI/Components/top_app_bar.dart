import 'package:dream_star/UI/ParentSide/Tasks/task_creation_screen.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends AppBar {
  TopAppBar(BuildContext context, String title, List<String> tabNames, {super.key})
      : super(
          title: Text(
            title,
            style: customTheme.textTheme.titleMedium,
          ),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: TabBar(
                dividerColor: white,
                indicatorColor: white,
                isScrollable: true,
                tabs: [for (var name in tabNames) Tab(child: Text(name))],
                labelStyle: titleMediumStyle,
                // labelColor: primary,
                unselectedLabelStyle: titleSmallStyle,
                // unselectedLabelColor: secondary,
              )),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const TaskCreationScreen();
                      },
                    ));
                  },
                  child: SvgPicture.asset("assets/plus-24px-white.svg")
                )
            )
          ],
        );
}
