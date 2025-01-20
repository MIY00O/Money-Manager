import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/features/transactions/presentation/pages/transaction_page.dart';
import 'package:money_manager/features/navigation/presentation/widgets/navigation_bottom.dart';
import 'package:money_manager/features/transactions/presentation/widget/transaction_form_bottom_sheet.dart';
import 'package:money_manager/features/wallets/presentation/pages/wallet_page.dart';

class NavigationCore extends StatefulWidget {
  const NavigationCore({super.key});

  @override
  State<NavigationCore> createState() => _NavigationCoreState();
}

class _NavigationCoreState extends State<NavigationCore> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const TransactionPage(),
    const WalletPage(),
    const Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const TransactionFormBottomSheet(mode: 0);
            },
          );
        },
        backgroundColor: AppTheme.secondaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: NavigationBottom(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
