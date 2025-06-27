import 'package:flutter/material.dart';

class LocalVehicle extends StatelessWidget {
  const LocalVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local vehicle"),
      ),
      body: const Center(
        child: Text("tom-tom"),
      ),
    );
  }
}