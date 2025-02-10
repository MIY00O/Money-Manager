import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';

class NavigationBottom extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const NavigationBottom({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppTheme.primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 12.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () => onTabSelected(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payment_rounded,
                    color: currentIndex == 0
                        ? Colors.white
                        : AppTheme.secondaryColor,
                  ),
                  Text(
                    'Transactions',
                    style: TextStyle(
                      color: currentIndex == 0
                          ? Colors.white
                          : AppTheme.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () => onTabSelected(1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet,
                    color: currentIndex == 1
                        ? Colors.white
                        : AppTheme.secondaryColor,
                  ),
                  Text(
                    'Wallets  ',
                    style: TextStyle(
                      color: currentIndex == 1
                          ? Colors.white
                          : AppTheme.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () => onTabSelected(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings,
                    color: currentIndex == 2
                        ? Colors.white
                        : AppTheme.secondaryColor,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: currentIndex == 2
                          ? Colors.white
                          : AppTheme.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
