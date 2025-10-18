import 'package:flutter/material.dart';

class DynamicImageExample extends StatelessWidget {
  final List<String> imageUrls = List.generate(
    10,
    (index) => "https://picsum.photos/200?random=$index",
  );

  DynamicImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Images")),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gambar ke-${index + 1} diklik!")),
                    );
                  },
                  child: Image.network(imageUrls[index]),
                ),
                Text("Gambar ke-${index + 1}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
