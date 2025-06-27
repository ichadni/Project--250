import 'package:flutter/material.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of top cities with their information
    final List<Map<String, String>> cities = [
      {
        "name": "Paris",
        "image": "lib/assets/images/cities/paris.jpg",
        "description": "Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy, and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine.",
        "country": "France",
      },
      {
        "name": "New York City",
        "image": "lib/assets/images/cities/newyork.webp",
        "description": "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial, and cultural centers.",
        "country": "USA",
      },
      {
        "name": "Tokyo",
        "image": "lib/assets/images/cities/tokyo.jpg",
        "description": "Tokyo, Japan’s bustling capital, mixes the ultramodern and the traditional, from neon-lit skyscrapers to historic temples. The opulent Meiji Shinto Shrine is known for its towering gate and surrounding woods.",
        "country": "Japan",
      },
      {
        "name": "Rome",
        "image": "lib/assets/images/cities/rome.jpg",
        "description": "Rome is the capital city of Italy. It is also the capital of the Lazio region, the centre of the Metropolitan City of Rome, and a special comune named Comune di Roma Capitale.",
        "country": "Italy",
      },
      {
        "name": "Sydney",
        "image": "lib/assets/images/cities/sydney.jpg",
        "description": "Sydney, capital of New South Wales and one of Australia's largest cities, is best known for its harbourfront Sydney Opera House, with a distinctive sail-like design.",
        "country": "Australia",
      },
      // Add more cities as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Cities of the World"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                cities[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                cities[index]["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cities[index]["description"]!),
                  const SizedBox(height: 4),
                  Text(
                    "Country: ${cities[index]["country"]!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                // You can add navigation to a detailed city page here
              },
            ),
          );
        },
      ),
    );
  }
}