import 'package:flutter/material.dart';

class LoadingTransactionWallet extends StatelessWidget {
  const LoadingTransactionWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textBone(),
        const SizedBox(height: 10),
        textBone(),
      ],
    );
  }

  Widget textBone() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
            color: Colors.grey.shade200,
          ),
          width: 100,
          height: 17,
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
            color: Colors.grey.shade200,
          ),
          width: 100,
          height: 17,
        ),
      ],
    );
  }
}
