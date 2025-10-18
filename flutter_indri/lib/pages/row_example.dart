import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row Example")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Item A", style: TextStyle(fontSize: 20)),
            SizedBox(width: 20),
            Text("Item B", style: TextStyle(fontSize: 20)),
            SizedBox(width: 20),
            Text("Item C", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
