import 'package:flutter/material.dart';

class GridLayoutExample extends StatelessWidget {
  const GridLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid Layout Example")),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        children: List.generate(
          6,
          (index) => Card(
            elevation: 4,
            child: Center(child: Text("Item ${index + 1}")),
          ),
        ),
      ),
    );
  }
}
