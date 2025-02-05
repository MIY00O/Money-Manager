import 'package:flutter/material.dart';
import 'package:money_manager/core/utils/bottom_sheet/create_modal_bottom_sheet.dart';
import 'package:money_manager/core/widgets/bottom_sheet/create_auto_bottom_sheet.dart';
import 'package:money_manager/core/widgets/button/create_button.dart';
import 'package:money_manager/features/transactions/transaction_form_bottom_sheet.dart';

class TransactionOptionBottomSheet extends StatelessWidget {
  const TransactionOptionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateAutoBottomSheet(
      widget: [
        const Text("Type Transaction",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text(
          "Click the button to select type transaction",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 15),
        CreateButton(
          onPressed: () {
            Navigator.pop(context);
            createModalBottomSheet(
              context,
              const TransactionFormBottomSheet(mode: 0, type: 1),
            );
          },
          label: "Income",
          fullsize: true,
        ),
        CreateButton(
          onPressed: () {
            Navigator.pop(context);
            createModalBottomSheet(
              context,
              const TransactionFormBottomSheet(mode: 0, type: 2),
            );
          },
          label: "Outcome",
          fullsize: true,
        ),
      ],
    );
  }
}
