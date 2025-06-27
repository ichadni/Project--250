import 'package:flutter/material.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearest Hospital"),
      ),
      body: const Center(
        child: Text("Nearest Hospital Screen"),
      ),
    );
  }
}