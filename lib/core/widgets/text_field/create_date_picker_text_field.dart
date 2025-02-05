import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/core/widgets/text_field/text_field_factory.dart';

class CreateDatePickerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final DateTime? firstDate;
  final DateTime? lastDate;

  CreateDatePickerTextField({
    super.key,
    required this.controller,
    required this.label,
    this.firstDate,
    this.lastDate,
  });

  final dateFormat = DateFormat("dd MMMM yyyy");

  @override
  Widget build(BuildContext context) {
    return TextFieldFactory(
      key: key,
      controller: controller,
      label: label,
      disabled: false,
      readOnly: true,
      keyboardType: TextInputType.none,
      floatingLabelColor: Colors.black,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: controller.text.isNotEmpty
              ? dateFormat.parse(controller.text)
              : DateTime.now(),
          firstDate: firstDate ?? DateTime(1910),
          lastDate: lastDate ?? DateTime.now(),
        );

        if (pickedDate != null) {
          controller.text = "${pickedDate.toLocal()}".split(' ')[0];
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            FocusScope.of(context).unfocus();
          });
        }
      },
    );
  }
}
