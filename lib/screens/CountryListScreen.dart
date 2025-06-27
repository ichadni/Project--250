// country_list_screen.dart
import 'package:flutter/material.dart';
import 'country_destinations_screen.dart';

class CountryListScreen extends StatelessWidget {
  final List<String> countries = [
    'Bangladesh',
    'France',
    'Japan',
    'Italy',
    'Brazil',
    'India',
    'Spain',
    'Germany',
    'Switzerland',
    'Nepal',
    'Bhutan',
    'Finland',
    'Norway',
    'Sweden',
    'Russia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countries[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CountryDestinationsScreen(country: countries[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
