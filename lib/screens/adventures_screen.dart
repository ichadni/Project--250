import 'package:flutter/material.dart';

class AdventuresScreen extends StatelessWidget {
  const AdventuresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of top adventures with their information
    final List<Map<String, String>> adventures = [
      {
        "name": "Skydiving",
        "image": "lib/assets/images/adventures/skydiving.jpg",
        "description": "Skydiving is an adrenaline-pumping activity where you jump from an aircraft and experience freefall before deploying a parachute to glide safely to the ground.",
        "location": "Various locations worldwide",
      },
      {
        "name": "Scuba Diving",
        "image": "lib/assets/images/adventures/scuba_diving.jpg",
        "description": "Scuba diving allows you to explore underwater worlds, including coral reefs, shipwrecks, and marine life. It requires training and certification.",
        "location": "Great Barrier Reef, Australia",
      },
      {
        "name": "Rock Climbing",
        "image": "lib/assets/images/adventures/rock_climbing.webp",
        "description": "Rock climbing is a physically and mentally demanding sport that involves climbing up, down, or across natural rock formations or artificial rock walls.",
        "location": "Yosemite National Park, USA",
      },
      {
        "name": "Bungee Jumping",
        "image": "lib/assets/images/adventures/bungee_jumping.jpg",
        "description": "Bungee jumping is an extreme sport where you jump from a tall structure while connected to a large elastic cord, experiencing a freefall and rebound.",
        "location": "Queenstown, New Zealand",
      },
      {
        "name": "Hiking",
        "image": "lib/assets/images/adventures/hiking.jpg",
        "description": "Hiking involves walking in natural environments, often on trails or paths in the mountains, forests, or countryside. It's a great way to explore nature and stay active.",
        "location": "Swiss Alps, Switzerland",
      },
      // Add more adventures as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Adventures of the World"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: adventures.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                adventures[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                adventures[index]["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(adventures[index]["description"]!),
                  const SizedBox(height: 4),
                  Text(
                    "Location: ${adventures[index]["location"]!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () {
                // You can add navigation to a detailed adventure page here
              },
            ),
          );
        },
      ),
    );
  }
}