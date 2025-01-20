import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';

class TextFieldFactory extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? disabled;
  final bool? readOnly;
  final Color? floatingLabelColor;
  final TextInputType? keyboardType;
  final int? maxLength;
  final VoidCallback? onTap;

  const TextFieldFactory({
    super.key,
    required this.controller,
    required this.label,
    this.disabled,
    this.floatingLabelColor,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: (controller.text.isEmpty)
              ? Colors.grey.shade600
              : AppTheme.primaryColor,
        ),
        floatingLabelStyle: TextStyle(
          color: floatingLabelColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppTheme.primaryColor,
            width: 2.4,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
      ),
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      controller: controller,
      enabled: disabled != true,
      keyboardType: keyboardType,
      onTap: onTap,
    );
  }
}
