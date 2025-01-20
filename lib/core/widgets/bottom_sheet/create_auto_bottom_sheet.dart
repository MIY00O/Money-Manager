import 'package:flutter/material.dart';
import 'package:money_manager/core/widgets/bottom_sheet/bottom_sheet_factory.dart';

class CreateAutoBottomSheet extends StatelessWidget {
  final List<Widget> widget;
  const CreateAutoBottomSheet({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return BottomSheetFactory(
      widget: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 24.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...widget,
          ],
        ),
      ),
    );
  }
}

class CreateInputField {}
