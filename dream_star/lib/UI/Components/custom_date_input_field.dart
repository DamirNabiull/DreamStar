import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateInputField extends StatefulWidget {
  final TextEditingController dateInput;

  const CustomDateInputField({super.key, required this.dateInput});

  @override
  State<StatefulWidget> createState() {
    return _CustomDateInputField();
  }
}

class _CustomDateInputField extends State<CustomDateInputField> {
  late TextEditingController _dateInput;

  @override
  void initState() {
    _dateInput = widget.dateInput;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: titleSmallStyle,
      controller: _dateInput,
      decoration: const InputDecoration(border: InputBorder.none),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: primary,
                  onPrimary: white,
                  onSurface: black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: primary,
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);

          setState(() {
            _dateInput.text = formattedDate;
          });
        } else {
          setState(() {
            _dateInput.text = DateFormat('dd.MM.yyyy').format(DateTime.now());
          });
        }
      },
    );
  }
}
