import 'package:flutter/material.dart';

class LoadingWallet extends StatelessWidget {
  const LoadingWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textBone(),
        const SizedBox(height: 10),
        textBone(),
        const SizedBox(height: 10),
        textBone(),
      ],
    );
  }

  Widget textBone() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        color: Colors.grey.shade200,
      ),
      height: 20,
    );
  }
}
