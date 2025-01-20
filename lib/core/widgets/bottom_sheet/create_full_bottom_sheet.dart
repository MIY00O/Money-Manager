import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/widgets/bottom_sheet/bottom_sheet_factory.dart';

class CreateFullBottomSheet extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonLabel;
  final Widget body;
  final Color? buttonColor;
  const CreateFullBottomSheet({
    super.key,
    required this.onPressed,
    required this.body,
    this.buttonLabel,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetFactory(
      widget: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: body,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 0.0),
                )
              ],
            ),
            padding:
                const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor ?? AppTheme.primaryColor),
              onPressed: onPressed,
              child: Text(buttonLabel ?? 'Save'),
            ),
          ),
        ),
      ),
    );
  }
}
