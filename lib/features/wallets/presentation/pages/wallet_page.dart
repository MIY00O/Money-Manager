import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/widgets/app_bar/create_app_bar.dart';
import 'package:money_manager/core/widgets/container/create_container.dart';
import 'package:money_manager/core/widgets/list_tile/create_list_tile.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
              CreateContainer(
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
              SizedBox(height: 10),
              CreateContainer(
                title: "Month",
                desc: "desc",
                widget: Column(
                  children: [
                    CreateListTile(
                      title: "Monthly Balance",
                      trailing: "1,000,000",
                      icon: Icons.money,
                    ),
                    CreateListTile(
                      title: "Monthly Incomes",
                      trailing: "2,000,000",
                      icon: Icons.arrow_upward_rounded,
                    ),
                    CreateListTile(
                      title: "Monthly Expenses",
                      trailing: "1,000,000",
                      icon: Icons.arrow_downward_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
