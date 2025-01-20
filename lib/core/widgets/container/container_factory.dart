import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';

class ContainerFactory extends StatelessWidget {
  final Color? backgroundColor;
  final Widget widget;

  const ContainerFactory(
      {super.key, this.backgroundColor, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: widget,
    );
  }
}
