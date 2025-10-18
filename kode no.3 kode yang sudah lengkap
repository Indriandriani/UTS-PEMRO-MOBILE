import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimalGallery(),
    );
  }
}

class AnimalGallery extends StatefulWidget {
  @override
  State<AnimalGallery> createState() => _AnimalGalleryState();
}

class _AnimalGalleryState extends State<AnimalGallery> {
  String selectedAnimal = '';

  // Daftar gambar hewan
  final List<Map<String, String>> animals = [
    {'name': 'Kucing', 'image': 'assets/cat.png'},
    {'name': 'Anjing', 'image': 'assets/dog.png'},
    {'name': 'Burung', 'image': 'assets/bird.png'},
    {'name': 'Kelinci', 'image': 'assets/rabbit.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeri Hewan")),
      body: SingleChildScrollView( // Menambahkan widget scroll agar tampilan bisa digulir
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Menampilkan dua gambar per baris menggunakan Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  animalWidget(animals[0]),
                  animalWidget(animals[1]),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  animalWidget(animals[2]),
                  animalWidget(animals[3]),
                ],
              ),
              SizedBox(height: 20),
              // Menampilkan nama hewan yang diklik
              Text(
                selectedAnimal.isEmpty
                    ? "Klik gambar untuk melihat nama hewan"
                    : "Hewan dipilih: $selectedAnimal",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan widget gambar hewan
  Widget animalWidget(Map<String, String> animal) {
    return GestureDetector(
      onTap: () {
        // Ganti state agar nama hewan tampil setelah diklik
        setState(() {
          selectedAnimal = animal['name']!;
        });
      },
      child: Column(
        children: [
          Image.asset(
            animal['image']!,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5),
          Text(animal['name']!),
        ],
      ),
    );
  }
}
