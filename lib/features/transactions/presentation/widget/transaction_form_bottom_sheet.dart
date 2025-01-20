import 'package:flutter/material.dart';
import 'package:money_manager/core/widgets/bottom_sheet/create_full_bottom_sheet.dart';
import 'package:money_manager/core/widgets/text_field/create_date_picker_text_field.dart';
import 'package:money_manager/core/widgets/text_field/create_text_field.dart';

class TransactionFormBottomSheet extends StatefulWidget {
  final int mode;
  const TransactionFormBottomSheet({super.key, required this.mode});

  @override
  State<TransactionFormBottomSheet> createState() =>
      _TransactionFormBottomSheetState();
}

class _TransactionFormBottomSheetState
    extends State<TransactionFormBottomSheet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    final timeOfDay = TimeOfDay.now();
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    timeController.text = "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return CreateFullBottomSheet(
      onPressed: () {},
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.mode == 0
                  ? "Add Transaction"
                  : widget.mode == 1
                      ? "Edit Transaction"
                      : "Form Transaction",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "this is the description",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            CreateTextField(
              controller: nameController,
              label: "Name",
            ),
            const SizedBox(height: 10),
            CreateTextField(
              controller: amountController,
              label: "Amount",
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 10),
            CreateTextField(
              controller: categoryController,
              label: "Category",
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: CreateDatePickerTextField(
                    controller: dateController,
                    label: "Date",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: CreateTextField(
                    controller: timeController,
                    label: "Time",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
