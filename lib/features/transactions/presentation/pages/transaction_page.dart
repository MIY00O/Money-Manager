import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/widgets/app_bar/create_app_bar.dart';
import 'package:money_manager/features/transactions/presentation/widget/transaction_form_bottom_sheet.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 180, bottom: 30),
            itemCount: 50,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const TransactionFormBottomSheet(mode: 1);
                    },
                  );
                },
                child: ListTile(
                  title: Text('Name $index'),
                  subtitle: const Text("Category"),
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "+ 1,000,000",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CreateAppBar(
                centerTitle: true,
                title: Text(
                  "Sel, 14 Jan 2025",
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Income"),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_upward_rounded,
                                      color: Colors.green,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text("1,200,000"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Outcome"),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_downward_rounded,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text("3,000,000"),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
