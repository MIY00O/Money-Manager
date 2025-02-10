import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/services/firestore_service.dart';
import 'package:money_manager/core/widgets/bottom_sheet/create_auto_bottom_sheet.dart';
import 'package:money_manager/core/widgets/button/create_button.dart';

class TransactionDeleteBottomSheet extends StatelessWidget {
  final String id;
  const TransactionDeleteBottomSheet({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CreateAutoBottomSheet(
      widget: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Delete Transaction",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Are you sure delete this transaction?",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            CreateButton(
              onPressed: () {
                Navigator.pop(context);
                FirestoreService().deleteTransaction(id);
              },
              label: "Delete Transaction",
              fullsize: true,
              backgroundColor: AppTheme.dangerColor,
            ),
          ],
        )
      ],
    );
  }
}
