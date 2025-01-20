import 'package:flutter/material.dart';
import 'package:money_manager/core/widgets/container/container_factory.dart';

class CreateContainer extends StatelessWidget {
  final String title;
  final String desc;
  final Widget widget;

  final Color? backgroundColor;
  const CreateContainer({
    super.key,
    required this.title,
    required this.desc,
    required this.widget,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerFactory(
      backgroundColor: backgroundColor,
      widget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            Text(
              desc,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
            ),
            const SizedBox(height: 10),
            widget,
          ],
        ),
      ),
    );
  }
}
