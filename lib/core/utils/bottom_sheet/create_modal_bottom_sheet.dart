import 'package:flutter/material.dart';

void createModalBottomSheet(
  BuildContext context,
  Widget widget,
) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return widget;
    },
  );
}
