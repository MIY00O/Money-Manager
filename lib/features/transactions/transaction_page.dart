import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/services/firestore_service.dart';
import 'package:money_manager/core/widgets/app_bar/create_app_bar.dart';
import 'package:money_manager/features/transactions/loading_transaction_wallet.dart';
import 'package:money_manager/features/transactions/transaction_form_bottom_sheet.dart';

class TransactionPage extends StatelessWidget {
  final FirestoreService transactionService = FirestoreService();

  TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
            stream: FirestoreService().getTransactionStream(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                List transactionList = snapshots.data!.docs;
                DateTime today = DateTime.now();
                transactionList = transactionList.where((doc) {
                  DateTime transactionDate =
                      (doc['date'] as Timestamp).toDate();
                  return transactionDate.year == today.year &&
                      transactionDate.month == today.month &&
                      transactionDate.day == today.day;
                }).toList();

                return ListView.builder(
                  itemCount: transactionList.length,
                  padding: const EdgeInsets.only(top: 180, bottom: 30),
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = transactionList[index];
                    String id = document.id;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String name = data['name'];
                    String category = data['category'];
                    String amount = data['amount'].toString();
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          useSafeArea: true,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return TransactionFormBottomSheet(
                              mode: 1,
                              id: id,
                              data: data,
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(name),
                        subtitle: Text(category),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              NumberFormat('#,###').format(int.parse(amount)),
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.keyboard_arrow_right_rounded),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CreateAppBar(
                centerTitle: true,
                title: Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: double.infinity,
                height: 90.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.6, 0.0],
                    colors: [
                      AppTheme.secondaryColor,
                      Color.fromARGB(0, 87, 156, 213),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: FutureBuilder<Map<String, int>>(
                          future:
                              transactionService.getTotalAmountForDate(today),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // return Text("TOlolo");
                              return const LoadingTransactionWallet();
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }

                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text('No transactions for today.'));
                            }

                            final totalIncome = snapshot.data!['income'] ?? 0;
                            final totalOutcome = snapshot.data!['outcome'] ?? 0;
                            print(totalIncome);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("Income"),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_upward_rounded,
                                          color: Colors.green,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(NumberFormat('#,###')
                                            .format(totalIncome)),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Outcome"),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_downward_rounded,
                                          color: Colors.red,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(NumberFormat('#,###')
                                            .format(totalOutcome)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
