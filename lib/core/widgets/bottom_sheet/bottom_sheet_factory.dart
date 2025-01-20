// custom_bottom_sheet.dart
import 'package:flutter/material.dart';

class BottomSheetFactory extends StatelessWidget {
  final Widget widget;

  const BottomSheetFactory({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          child: Center(
            child: Container(
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Divider(
          color: Colors.grey.shade200,
          height: 1,
        ),
        widget
      ],
    );
  }
}
