import 'package:flutter/material.dart';

class MountainsScreen extends StatelessWidget {
  const MountainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of top mountains with their information
    final List<Map<String, String>> mountains = [
      {
        "name": "Mount Everest",
        "image": "lib/assets/images/mountains/everest.webp",
        "description": "Mount Everest is the Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point.",
        "height": "8,848 meters",
      },
      {
        "name": "K2",
        "image": "lib/assets/images/mountains/k2.webp",
        "description": "K2 is the second-highest mountain on Earth, after Mount Everest. It is located on the China–Pakistan border between Baltistan in the Gilgit-Baltistan region of northern Pakistan, and Dafdar Township in Taxkorgan Tajik Autonomous County of Xinjiang, China.",
        "height": "8,611 meters",
      },
      {
        "name": "Kangchenjunga",
        "image": "lib/assets/images/mountains/Kangchenjunga.webp",
        "description": "Kangchenjunga is the third highest mountain in the world. It lies between Nepal and Sikkim, India, with three of the five peaks (Main, Central, and South) directly on the border, and the remaining two (West and Kangbachen) in Nepal's Taplejung District.",
        "height": "8,586 meters",
      },
      {
        "name": "Lhotse",
        "image": "lib/assets/images/mountains/lhotse.jpg",
        "description": "Lhotse is the fourth highest mountain in the world at 8,516 metres, after Mount Everest, K2, and Kangchenjunga. It is located on the border between Tibet and Nepal.",
        "height": "8,516 meters",
      },
      {
        "name": "Makalu",
        "image": "lib/assets/images/mountains/makalu.webp",
        "description": "Makalu is the fifth highest mountain in the world at 8,485 metres. It is located in the Mahalangur Himalayas 19 km southeast of Mount Everest, on the border between Nepal and China.",
        "height": "8,485 meters",
      },
      // Add more mountains as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Mountains of the World"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: mountains.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                mountains[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                mountains[index]["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mountains[index]["description"]!),
                  const SizedBox(height: 4),
                  Text(
                    "Height: ${mountains[index]["height"]!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                // You can add navigation to a detailed mountain page here
              },
            ),
          );
        },
      ),
    );
  }
}