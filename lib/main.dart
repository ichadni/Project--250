import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_asst/widgets/bottom_nav_bar.dart';
import 'package:travel_asst/screens/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAnAPbQR4POLbYgWJrQYI5Q20bvY1eUk1E",
        authDomain: "travel-assistant-54372.firebaseapp.com",
        projectId: "travel-assistant-54372",
        storageBucket: "travel-assistant-54372.firebasestorage.app",
        messagingSenderId: "998315877604",
        appId: "1:998315877604:web:aeb069a4ebefe72f7fb8f1",
        measurementId: "G-VJKKBXERJ8"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
        return MaterialApp(
          title: 'Travel Guide',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: snapshot.data == true ? const BottomNavBar() : LoginScreen(),
        );
      },
    );
  }
}
