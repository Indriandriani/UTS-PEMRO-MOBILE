import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Mini Project")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/scroll'),
                child: const Text("Scroll"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/grid'),
                child: const Text("Grid"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/images'),
                child: const Text("Images"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Banner diklik!")),
              );
            },
            child: Image.network(
              "https://picsum.photos/400/200?random=1",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
