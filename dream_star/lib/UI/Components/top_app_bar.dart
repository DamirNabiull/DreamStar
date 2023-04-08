import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';

class TopAppBar extends AppBar {
  TopAppBar(String title, List<String> tabNames, {super.key})
      : super(
      title: Text(
        title,
        style: customTheme.textTheme.titleMedium,
      ),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TabBar(isScrollable: true, tabs: [
            for (var name in tabNames) Tab(child: Text(name))
          ])));
}
