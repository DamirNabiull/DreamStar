import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../Components/custom_text_field.dart';
import '../../Components/unified_fields.dart';

const List<int> taskCostList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class TaskCreationScreen extends StatefulWidget {
  final List<String> childrenNamesList;
  const TaskCreationScreen({super.key, required this.childrenNamesList});

  @override
  TaskCreationScreenState createState() => TaskCreationScreenState();
}

class TaskCreationScreenState extends State<TaskCreationScreen> {
  int dropdownCostValue = taskCostList.first;
  late String dropdownNameValue;


  @override
  void initState() {
    super.initState();
    dropdownNameValue = widget.childrenNamesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: Text('new-task-title'.i18n()),
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17.0)),
        backgroundColor: const Color(0x00F6F5FF),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: Column(
            children: [
              buildDescriptionSection(),
              const SizedBox(height: 12),
              buildChildSection(),
              const SizedBox(height: 12),
              buildCostSection(),
              const SizedBox(height: 12),
            ],
          ),
        ));
  }

  Widget buildDescriptionSection() {
    return UnifiedFields(
        widget1: CustomTextField(
            TextEditingController(), 'task-title'.i18n(), 1, 25),
        widget2: CustomTextField(TextEditingController(),
            'task-description'.i18n(), 1, 125));
  }

  Widget buildChildSection() {
    return UnifiedFields(
        widget1: Row(
          children: [
            Text('child-title'.i18n(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0)),
            const Spacer(),
            DropdownButton<String>(
              value: dropdownNameValue,
              isDense: true,
              borderRadius: BorderRadius.circular(12.0),
              icon: const Icon(Icons.unfold_more_rounded,
                  color: Colors.black),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17.0),
              underline: const SizedBox.shrink(),
              onChanged: (String? value) {
                setState(() {
                  dropdownNameValue = value!;
                });
              },
              items: widget.childrenNamesList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
        widget2: null
    );
  }

  Widget buildCostSection() {
    return UnifiedFields(
        widget1: Row(
          children: [
            Text('cost-title'.i18n(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0)),
            const Spacer(),
            DropdownButton<int>(
              value: dropdownCostValue,
              isDense: true,
              borderRadius: BorderRadius.circular(12.0),
              icon: const Icon(Icons.unfold_more_rounded,
                  color: Colors.black),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17.0),
              underline: const SizedBox.shrink(),
              onChanged: (int? value) {
                setState(() {
                  dropdownCostValue = value!;
                });
              },
              items: taskCostList.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            )
          ],
        ),
        widget2: null);
  }
}
