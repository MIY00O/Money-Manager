import 'package:flutter/material.dart';
import 'package:money_manager/core/constants/app_theme.dart';

class CreateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool? centerTitle;
  final Widget? bottom;
  final double bottomHeight;

  static const double fixedHeight = 50.0;

  const CreateAppBar(
      {super.key,
      this.title,
      this.centerTitle,
      this.bottom,
      this.bottomHeight = 48.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.primaryColor,
      toolbarHeight: fixedHeight,
      centerTitle: centerTitle,
      title: title,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(fixedHeight + (bottom != null ? bottomHeight : 0));
  }
}
