import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 2, 171, 255),
      //width: double.infinity,
      width: 200,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Eres lo mejor de mi vida"),
          Text("Eres lo mejor de mi vida"),
          Text("Eres lo mejor de mi vida"),
          Text("Eres lo mejor de mi vida"),
          Text("Eres lo mejor de mi vida"),
          Text("Eres lo mejor de mi vida"),
        ],
      ),
    );
  }
}
