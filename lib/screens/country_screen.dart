import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destinations by Country"),
      ),
      body: const Center(
        child: Text("Destinations by Country Screen"),
      ),
    );
  }
}