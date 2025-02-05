import 'package:flutter/material.dart';
import 'package:money_manager/core/widgets/text_field/text_field_factory.dart';

class CreateReadonlyTextField extends TextFieldFactory {
  const CreateReadonlyTextField(
      {super.key,
      required super.controller,
      required super.label,
      super.keyboardType,
      super.maxLength})
      : super(
          readOnly: true,
          disabled: false,
          floatingLabelColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 221, 216, 216),
        );
}
