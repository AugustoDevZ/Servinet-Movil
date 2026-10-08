import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        children: [Text("Te amo"), Text("Te amo"), Text("Te amo")],
      ),
    );
  }
}
