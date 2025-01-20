import 'package:flutter/material.dart';

class CreateListTile extends StatelessWidget {
  final String title;
  final String trailing;
  final IconData icon;
  final Color? iconColor;
  const CreateListTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              Text(
                trailing,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 5),
              Icon(icon, color: iconColor ?? Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
