import 'package:flutter/material.dart';

class LocalLanguageScreen extends StatelessWidget {
  const LocalLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Language")),
      body: const Center(child: Text("Local Language Screen")),
    );
  }
}