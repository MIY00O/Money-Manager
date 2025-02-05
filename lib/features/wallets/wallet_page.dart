import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/services/firestore_service.dart';
import 'package:money_manager/core/widgets/app_bar/create_app_bar.dart';
import 'package:money_manager/core/widgets/container/create_container.dart';
import 'package:money_manager/core/widgets/list_tile/create_list_tile.dart';
import 'package:money_manager/features/wallets/loading_wallet.dart';

class WalletPage extends StatelessWidget {
  final FirestoreService transactionService = FirestoreService();

  WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Scaffold(
      appBar: const CreateAppBar(
        title: Text(
          "Wallet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateContainer(
                backgroundColor: AppTheme.secondaryColor,
                title: "Total",
                desc: "desc",
                widget: Column(
                  children: [
                    CreateListTile(
                      title: "Total Balance",
                      trailing: "1,000,000",
                      icon: Icons.money,
                    ),
                    CreateListTile(
                      title: "Total Incomes",
                      trailing: "2,000,000",
                      icon: Icons.arrow_upward_rounded,
                    ),
                    CreateListTile(
                      title: "Total Expenses",
                      trailing: "1,000,000",
                      icon: Icons.arrow_downward_rounded,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CreateContainer(
                title: "Month",
                desc: "desc",
                widget: FutureBuilder<Map<String, int>>(
                  future: transactionService.getTotalAmountForMonth(today),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWallet();
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No transactions for today.'),
                      );
                    }

                    final totalIncome = snapshot.data!['income'] ?? 0;
                    final totalOutcome = snapshot.data!['outcome'] ?? 0;

                    final totalMoney = totalIncome - totalOutcome;
                    return Column(
                      children: [
                        CreateListTile(
                          title: "Monthly Balance",
                          trailing: NumberFormat('#,###').format(totalMoney),
                          icon: Icons.money,
                        ),
                        const SizedBox(height: 5),
                        CreateListTile(
                          title: "Monthly Incomes",
                          trailing: NumberFormat('#,###').format(totalIncome),
                          icon: Icons.arrow_upward_rounded,
                        ),
                        const SizedBox(height: 5),
                        CreateListTile(
                          title: "Monthly Expenses",
                          trailing: NumberFormat('#,###').format(totalOutcome),
                          icon: Icons.arrow_downward_rounded,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
