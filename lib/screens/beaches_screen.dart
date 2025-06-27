import 'package:flutter/material.dart';

class BeachesScreen extends StatelessWidget {
  const BeachesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of top beaches with their information
    final List<Map<String, String>> beaches = [
      {
        "name": "Bora Bora",
        "image": "lib/assets/images/beaches/bora_bora.jpg",
        "description": "Bora Bora is a small South Pacific island northwest of Tahiti in French Polynesia. Surrounded by sand-fringed motus (islets) and a turquoise lagoon protected by a coral reef, it's known for its scuba diving.",
        "location": "French Polynesia",
      },
      {
        "name": "Maldives",
        "image": "lib/assets/images/beaches/maldives.jpg",
        "description": "The Maldives is a tropical nation in the Indian Ocean composed of 26 ring-shaped atolls, which are made up of more than 1,000 coral islands. It's known for its beaches, blue lagoons, and extensive reefs.",
        "location": "Indian Ocean",
      },
      {
        "name": "Seychelles",
        "image": "lib/assets/images/beaches/seychelles.jpg",
        "description": "Seychelles is an archipelago of 115 islands in the Indian Ocean, off East Africa. It's home to numerous beaches, coral reefs, and nature reserves, as well as rare animals such as giant Aldabra tortoises.",
        "location": "Indian Ocean",
      },
      {
        "name": "Maui",
        "image": "lib/assets/images/beaches/mavi.jpg",
        "description": "Maui is an island in the Central Pacific, part of the Hawaiian archipelago. Sprawling Haleakala National Park encompasses the island’s highest peak, volcanic Haleakala, as well as the pools and waterfalls of Ohe’o Gulch, accessed via scenic, winding Hana Highway.",
        "location": "Hawaii, USA",
      },
      {
        "name": "Whitehaven Beach",
        "image": "lib/assets/images/beaches/whitehaven.jpg",
        "description": "Whitehaven Beach is a 7 km stretch along Whitsunday Island, Australia. The island is accessible by boat, seaplane, and helicopter from Airlie Beach, as well as Hamilton Island.",
        "location": "Whitsunday Island, Australia",
      },
      // Add more beaches as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Beaches of the World"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: beaches.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                beaches[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                beaches[index]["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(beaches[index]["description"]!),
                  const SizedBox(height: 4),
                  Text(
                    "Location: ${beaches[index]["location"]!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                // You can add navigation to a detailed beach page here
              },
            ),
          );
        },
      ),
    );
  }
}