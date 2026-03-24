import 'package:flutter/material.dart';
import 'dart:math'; // Necesario para generar calificaciones aleatorias

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SnacksMenuPage(),
    );
  }
}

class SnacksMenuPage extends StatelessWidget {
  const SnacksMenuPage({super.key});

  final List<String> imagenes = const [
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d1.jpg',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d2.jpg',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d3.jpg',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d4.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d5.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d6.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d7.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d8.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d9.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d10.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d11.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d12.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d13.PNG',
    'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/d14.PNG',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: const Icon(Icons.fastfood, color: Colors.black),
        title: const Text(
          'Snacks',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // Ajustado para dar espacio a las estrellas
        ),
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          final bool esGrande = index < 3;
          
          // Generamos una calificación aleatoria entre 3.5 y 5.0
          double rating = 3.5 + Random().nextDouble() * (5.0 - 3.5);

          return Container(
            // --- MARCO AMARILLO ---
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen con ClipRRect para respetar los bordes
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Center(
                      child: Image.network(
                        imagenes[index],
                        fit: esGrande ? BoxFit.cover : BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                // --- SECCIÓN DE TEXTO Y ESTRELLAS ---
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Producto ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      // Fila de estrellas
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star_half, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating.toStringAsFixed(1),
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}