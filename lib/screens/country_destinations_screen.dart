// country_destinations_screen.dart
import 'package:flutter/material.dart';
import 'destinations_details.dart';

class CountryDestinationsScreen extends StatelessWidget {
  final String country;

  CountryDestinationsScreen({required this.country});

  final Map<String, List<Map<String, String>>> countryDestinations = {
    'Bangladesh': [
      {
        'name': 'Cox’s Bazar',
        'image': 'lib/assets/images/cox.jpg',
        'description': 'Longest sea beach in the world.'
      },
      {
        'name': 'Sundarbans',
        'image': 'lib/assets/images/sundarbans.jpg',
        'description': 'World’s largest mangrove forest.'
      },
    ],
    'France': [
      {
        'name': 'Eiffel Tower',
        'image': 'lib/assets/images/paris.webp',
        'description': 'Iconic iron tower in Paris.'
      },
    ],
    'Japan': [
      {
        'name': 'Tokyo',
        'image': 'lib/assets/images/tokyo.jpg',
        'description': 'Vibrant capital city of Japan.'
      },
    ],
    // Add more countries similarly
    'Norway': [
      {
        'name': 'Norway',
        'image': 'lib/assets/images/country_plc/norway.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Sweden': [
      {
        'name': 'Sweden',
        'image': 'lib/assets/images/country_plc/sweden.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Bhutan': [
      {
        'name': 'bhutaniiiiplcs',
        'image': 'lib/assets/images/country_plc/bhutan.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Nepal': [
      {
        'name': 'Kathmundu',
        'image': 'lib/assets/images/country_plc/nepal.jpg',
        'description': 'Vibrant .'
      },
      {
        'name': 'Himalaya',
        'image': 'lib/assets/images/country_plc/himalaya.jpg',
        'description': 'Vibrant .'
      },
    ],

    'India': [
      {
        'name': 'Kashmir',
        'image': 'lib/assets/images/country_plc/kashmir.jpg',
        'description': 'Vibrant .'
      },
      {
        'name': 'Darjeeling',
        'image': 'lib/assets/images/country_plc/darjeeling.jpg',
        'description': 'Vibrant .'
      },
      {
        'name': 'Meghalaya',
        'image': 'lib/assets/images/country_plc/meghalaya.jpg',
        'description': 'Vibrant .'
      },
      {
        'name': 'Bombey',
        'image': 'lib/assets/images/country_plc/bombey.jpg',
        'description': 'Vibrant .'
      },
      {
        'name': 'Delhi',
        'image': 'lib/assets/images/country_plc/delhi.jpg',
        'description': 'Vibrant .'
      },

    ],

    'Russia': [
      {
        'name': 'moscow',
        'image': 'lib/assets/images/country_plc/moscow.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Germany': [
      {
        'name': 'berlin',
        'image': 'lib/assets/images/country_plc/berlin.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Italy': [
      {
        'name': 'Norway',
        'image': 'lib/assets/images/country_plc/norway.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Brazil': [
      {
        'name': 'Norway',
        'image': 'lib/assets/images/country_plc/norway.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Spain': [
      {
        'name': 'Norway',
        'image': 'lib/assets/images/country_plc/norway.jpg',
        'description': 'Vibrant .'
      },
    ],

    'Switzerland': [
      {
        'name': 'Norway',
        'image': 'lib/assets/images/country_plc/norway.jpg',
        'description': 'Vibrant .'
      },
    ],


  };

  @override
  Widget build(BuildContext context) {
    final destinations = countryDestinations[country] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('$country Destinations')),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final dest = destinations[index];
          return ListTile(
            leading: Image.asset(dest['image']!, width: 60, height: 60, fit: BoxFit.cover),
            title: Text(dest['name']!),
            subtitle: Text(dest['description']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DestinationDetailScreen(
                    name: dest['name']!,
                    imagePath: dest['image']!,
                    description: dest['description']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
