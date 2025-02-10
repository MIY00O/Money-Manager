import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/utils/bottom_sheet/create_modal_bottom_sheet.dart';
import 'package:money_manager/core/widgets/bottom_sheet/create_auto_bottom_sheet.dart';
import 'package:money_manager/core/widgets/button/create_button.dart';
import 'package:money_manager/features/transactions/transaction_delete_bottom_sheet.dart';
import 'package:money_manager/features/transactions/transaction_details_bottom_sheet.dart';
import 'package:money_manager/features/transactions/transaction_form_bottom_sheet.dart';

class TransactionSelectBottomSheet extends StatelessWidget {
  final String id;
  final Map<String, dynamic> data;
  const TransactionSelectBottomSheet(
      {super.key, required this.id, required this.data});

  @override
  Widget build(BuildContext context) {
    return CreateAutoBottomSheet(
      widget: [
        CreateButton(
          onPressed: () {
            Navigator.pop(context);
            createModalBottomSheet(
              context,
              TransactionDetailsBottomSheet(id: id, data: data),
            );
          },
          label: "Details Transaction",
          fullsize: true,
        ),
        CreateButton(
          onPressed: () {
            Navigator.pop(context);
            createModalBottomSheet(
              context,
              TransactionFormBottomSheet(mode: 1, id: id, data: data),
            );
          },
          label: "Edit Transaction",
          fullsize: true,
        ),
        CreateButton(
          onPressed: () {
            Navigator.pop(context);
            createModalBottomSheet(
                context, TransactionDeleteBottomSheet(id: id));
          },
          label: "Delete Transaction",
          fullsize: true,
          backgroundColor: AppTheme.dangerColor,
        )
      ],
    );
  }
}
