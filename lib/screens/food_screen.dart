import 'package:flutter/material.dart';

class FoodsScreen extends StatelessWidget {
  const FoodsScreen({super.key});

  // List of famous foods with image paths and names
  final List<Map<String, String>> foods = const [
    {
      "name": "Buenos-Aires-Choripan",
      "image": "lib/assets/images/famous_foods/buenos-aires-choripan.webp",
    },
    {
      "name": "Chilli Crab, Singapore",
      "image": "lib/assets/images/famous_foods/chilli_crab_singapore.webp",
    },
    {
      "name": "Fuchka, Bangladesh",
      "image": "lib/assets/images/famous_foods/fuchka.webp",
    },
    {
      "name": "Hot pot, China",
      "image": "lib/assets/images/famous_foods/hot_pot_china.webp",
    },
    {
      "name": "Pizza, Italy",
      "image": "lib/assets/images/famous_foods/pizza.jpg",
    },
    {
      "name": "Teokbokki, South Korea",
      "image": "lib/assets/images/famous_foods/tteokbokki-seoul.webp",
    },
    {
      "name": "PineApple Bun, Hong-Kong",
      "image": "lib/assets/images/famous_foods/pineapple_bun_hongkong.webp",
    },
    {
      "name": "Roti Kanai, Thailand",
      "image": "lib/assets/images/famous_foods/roti_kanai_thailand.jpg",
    },
    {
      "name": "Fish and Chips, UK",
      "image": "lib/assets/images/famous_foods/fish_and_chips_london.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Famous Foods"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  food["image"]!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                food["name"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}
