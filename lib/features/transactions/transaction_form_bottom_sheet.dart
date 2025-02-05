import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/core/services/firestore_service.dart';
import 'package:money_manager/core/widgets/bottom_sheet/create_full_bottom_sheet.dart';
import 'package:money_manager/core/widgets/text_field/create_date_picker_text_field.dart';
import 'package:money_manager/core/widgets/text_field/create_readonly_text_field.dart';
import 'package:money_manager/core/widgets/text_field/create_text_field.dart';
import 'package:intl/intl.dart';

class TransactionFormBottomSheet extends StatefulWidget {
  final int mode; // mode 0 = add data, mode 1 = outcome
  final int? type; //type 1 = income, type 2 = outcome
  final String? id;
  final Map<String, dynamic>? data;
  const TransactionFormBottomSheet(
      {super.key, required this.mode, this.id, this.data, this.type});

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
  final TextEditingController typeController = TextEditingController();

  String getFormattedResult(String value) {
    if (value == '1') {
      return 'Income';
    } else if (value == '2') {
      return 'Outcome';
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    updateTime();

    if (widget.mode == 0) {
      typeController.text = getFormattedResult(widget.type!.toString());
    }

    if (widget.mode == 1) {
      nameController.text = widget.data!['name'];
      amountController.text = widget.data!['amount'].toString();
      categoryController.text = widget.data!['category'];
      Timestamp timestamp = widget.data!['date'];

      DateTime dateTime = timestamp.toDate();
      String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
      dateController.text = formattedDate;
      timeController.text = widget.data!['time'];
    }
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
      onPressed: () {
        FirestoreService().addTransaction(
          nameController.text,
          int.parse(amountController.text),
          categoryController.text,
          DateTime.parse(dateController.text),
          timeController.text,
        );
        Navigator.pop(context);
      },
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
            CreateReadonlyTextField(
              controller: typeController,
              label: "Type",
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
