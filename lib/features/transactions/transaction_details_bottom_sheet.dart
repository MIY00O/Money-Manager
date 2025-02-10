import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/core/widgets/bottom_sheet/create_auto_bottom_sheet.dart';

class TransactionDetailsBottomSheet extends StatelessWidget {
  final String id;
  final Map<String, dynamic> data;
  const TransactionDetailsBottomSheet({
    super.key,
    required this.id,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CreateAutoBottomSheet(
      widget: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Detail Transaction",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "This is the detail transaction",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              _listTile("Type", data['type'] == 1 ? 'Income' : 'Outcome'),
              _listTile("name", data['name']),
              _listTile("Category", data['category']),
              _listTile("Amount", NumberFormat('#,###').format(data['amount'])),
              _listTile(
                  "Date",
                  DateFormat('d MMMM y')
                      .format((data['date'] as Timestamp).toDate())),
              _listTile("time", data['time'])
            ],
          ),
        ),
      ],
    );
  }

  Widget _listTile(String title, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 18)),
              const Text(":"),
            ],
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
