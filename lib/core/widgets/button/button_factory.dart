import 'package:flutter/material.dart';

class ButtonFactory extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String label;
  final Color? labelColor;
  final bool? fullsize;

  const ButtonFactory({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.label,
    required this.labelColor,
    this.fullsize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullsize == true ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: labelColor ?? Colors.white),
        ),
      ),
    );
  }
}
