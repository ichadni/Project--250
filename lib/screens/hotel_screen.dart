import 'package:flutter/material.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearest Hotels"),
      ),
      body: const Center(
        child: Text("Nearest Hotels Screen"),
      ),
    );
  }
}