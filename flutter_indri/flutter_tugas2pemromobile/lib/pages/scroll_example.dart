import 'package:flutter/material.dart';

class ScrollExample extends StatelessWidget {
  const ScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scroll Example")),
      body: ListView(
        children: List.generate(
          20,
          (index) => ListTile(
            leading: const Icon(Icons.star),
            title: Text("Item ke-${index + 1}"),
          ),
        ),
      ),
    );
  }
}
