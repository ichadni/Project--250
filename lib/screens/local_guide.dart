import 'package:flutter/material.dart';

class LocalGuideScreen extends StatelessWidget {
  const LocalGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Guide")),
      body: const Center(child: Text("Local Guide Screen")),
    );
  }
}