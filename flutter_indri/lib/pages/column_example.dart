import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Item 1", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Item 2", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Item 3", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

