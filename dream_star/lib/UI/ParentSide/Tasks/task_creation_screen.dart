import 'package:dream_star/UI/themes.dart';
import 'package:dream_star/UI/Components/custom_date_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int dropdownCostValue = taskCostList.first;
  late String dropdownNameValue;
  bool deadlineFlag = false;
  final TextEditingController _dateInput = TextEditingController();
  bool penaltyFlag = false;
  late List<int> taskPenaltyList;
  late int dropdownPenaltyValue;
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    dropdownNameValue = widget.childrenNamesList.first;
    _dateInput.text = DateFormat('dd.MM.yyyy').format(DateTime.now());
    taskPenaltyList = List<int>.generate(dropdownCostValue, (i) => i + 1);
    dropdownPenaltyValue = taskPenaltyList.first;

    _titleController.addListener(() {
      final String text = _titleController.text;

      setState(() {
        if (text.isEmpty){
          isButtonDisabled = true;
        } else {
          isButtonDisabled = false;
        }
      });

      _titleController.value = _titleController.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    _descriptionController.addListener(() {
      final String text = _descriptionController.text;
      _descriptionController.value = _descriptionController.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primary,
            title: Text('new-task-title'.i18n()),
            titleTextStyle: titleMediumStyle.copyWith(color: white)),
        backgroundColor: primaryBackground,
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 28),
                          buildDescriptionSection(),
                          const SizedBox(height: 12),
                          buildChildSection(),
                          const SizedBox(height: 12),
                          buildCostSection(),
                          const SizedBox(height: 12),
                          buildDeadlineSection(),
                          const SizedBox(height: 12),
                          buildPenaltySection()
                        ],
                      ),
                    )),
                buildButton(),
                const SizedBox(height: 20),
              ],
            )));
  }

  Widget buildDescriptionSection() {
    return UnifiedFields(
        widget1: CustomTextField(
            textEditingController: _titleController,
            placeholder: 'task-title'.i18n(),
            maxLines: 1,
            maxLength: 35),
        widget2: CustomTextField(
            textEditingController: _descriptionController,
            placeholder: 'task-description'.i18n(),
            maxLines: 5,
            maxLength: 125));
  }

  Widget buildChildSection() {
    return UnifiedFields(
        widget1: Row(
          children: [
            Text('child-title'.i18n(),
                style: titleSmallStyle),
            const Spacer(),
            DropdownButton<String>(
              value: dropdownNameValue,
              isDense: true,
              borderRadius: BorderRadius.circular(12.0),
              icon: SvgPicture.asset('assets/arrow-separate-vertical-20px-black.svg'),
              style: titleSmallStyle,
              underline: const SizedBox.shrink(),
              onChanged: (String? value) {
                setState(() {
                  dropdownNameValue = value!;
                });
              },
              items: widget.childrenNamesList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
        widget2: null);
  }

  Widget buildCostSection() {
    return UnifiedFields(
        widget1: Row(
          children: [
            Text('cost-title'.i18n(),
                style: titleSmallStyle),
            const Spacer(),
            DropdownButton<int>(
              value: dropdownCostValue,
              isDense: true,
              alignment: AlignmentDirectional.centerEnd,
              borderRadius: BorderRadius.circular(12.0),
              icon: SvgPicture.asset('assets/arrow-separate-vertical-20px-black.svg'),
              style: titleSmallStyle,
              underline: const SizedBox.shrink(),
              onChanged: (int? value) {
                setState(() {
                  dropdownCostValue = value!;
                  if (dropdownCostValue < dropdownPenaltyValue) {
                    dropdownPenaltyValue = dropdownCostValue;
                  }
                  taskPenaltyList =
                  List<int>.generate(dropdownCostValue, (i) => i + 1);
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

  Widget buildDeadlineSection() {
    return UnifiedFields(
        widget1: Row(children: [
          Text('deadline-title'.i18n(),
              style: titleSmallStyle),
          const Spacer(),
          Container(
            constraints: const BoxConstraints(maxHeight: 25.0),
            child: Switch(
                value: deadlineFlag,
                activeColor: primary,
                inactiveTrackColor: secondary,
                onChanged: (bool value) {
                  setState(() {
                    deadlineFlag = value;
                  });
                }),
          )
        ]),
        widget2:
        deadlineFlag ? CustomDateInputField(dateInput: _dateInput) : null);
  }

  Widget buildPenaltySection() {
    return UnifiedFields(
        widget1: Row(children: [
          Text('penalty-title'.i18n(),
              style: titleSmallStyle),
          const Spacer(),
          Container(
            constraints: const BoxConstraints(maxHeight: 25.0),
            child: Switch(
                value: penaltyFlag,
                activeColor: primary,
                inactiveTrackColor: secondary,
                onChanged: (bool value) {
                  setState(() {
                    penaltyFlag = value;
                  });
                }),
          )
        ]),
        widget2: penaltyFlag ? buildPenaltyCostSection() : null);
  }

  Widget buildPenaltyCostSection() {
    return Row(
      children: [
        Text('penalty-cost-title'.i18n(),
            style: titleSmallStyle),
        const Spacer(),
        DropdownButton<int>(
          value: dropdownPenaltyValue,
          isDense: true,
          borderRadius: BorderRadius.circular(12.0),
          alignment: AlignmentDirectional.centerEnd,
          icon: SvgPicture.asset('assets/arrow-separate-vertical-20px-black.svg'),
          style: titleSmallStyle,
          underline: const SizedBox.shrink(),
          onChanged: (int? value) {
            setState(() {
              dropdownPenaltyValue = value!;
            });
          },
          items: taskPenaltyList.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            disabledBackgroundColor: primaryMuted,
            backgroundColor: primary,
            shadowColor: secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)
            ),
            minimumSize: const Size.fromHeight(54)
        ),
        onPressed: isButtonDisabled ? null : (){},
        child: Text(
          'create-task'.i18n(),
          style: titleLargeStyle.copyWith(color: isButtonDisabled ? secondary : white),
        )
    );
  }
}
