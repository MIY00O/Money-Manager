import 'package:flutter/material.dart';
import 'package:money_manager/core/widgets/text_field/text_field_factory.dart';

class CreateTextField extends TextFieldFactory {
  const CreateTextField(
      {super.key,
      required super.controller,
      required super.label,
      super.keyboardType,
      super.maxLength})
      : super(
          disabled: false,
          floatingLabelColor: Colors.black,
        );
}
