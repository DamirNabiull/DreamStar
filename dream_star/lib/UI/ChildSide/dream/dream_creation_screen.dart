import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/dream_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import '../../Components/custom_text_field.dart';
import '../../Components/unified_fields.dart';
import '../../themes.dart';

class DreamCreationScreen extends ConsumerStatefulWidget {
  const DreamCreationScreen({super.key});

  @override
  DreamCreationScreenState createState() => DreamCreationScreenState();
}

class DreamCreationScreenState extends ConsumerState<DreamCreationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      final String text = _titleController.text;

      setState(() {
        if (text.isEmpty) {
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
            centerTitle: true,
            title: Text('new-dream-title'.i18n()),
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
                      buildDescriptionSection()
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
            placeholder: 'dream-title'.i18n(),
            maxLines: 1,
            maxLength: 35),
        widget2: CustomTextField(
            textEditingController: _descriptionController,
            placeholder: 'dream-description'.i18n(),
            maxLines: 5,
            maxLength: 125));
  }

  Widget buildButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            disabledBackgroundColor: primaryMuted,
            backgroundColor: primary,
            shadowColor: secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            minimumSize: const Size.fromHeight(54)),
        onPressed: isButtonDisabled
            ? null
            : () {
                DreamInfo dream = DreamInfo(
                  _titleController.text,
                  _descriptionController.text,
                  0,
                  DreamStatus.review,
                  null,
                  ref.read(userProvider).getUserName(),
                  ref.read(userProvider).getUserId(),
                );
                dream.createdAt = DateTime.now();
                ref.read(fireStoreProvider).createDream(dream);
                Navigator.pop(context);
              },
        child: Text(
          'create-dream'.i18n(),
          style: titleLargeStyle.copyWith(
              color: isButtonDisabled ? secondary : white),
        ));
  }
}
