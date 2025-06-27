import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    checkEmailVerified();
  }

  Future<void> checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload(); // Important!
    if (user != null && user.emailVerified) {
      setState(() {
        _isVerified = true;
      });

      // Navigate to main app
      Navigator.pushReplacementNamed(context, '/home'); // or BottomNavBar()
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isVerified
            ? CircularProgressIndicator()
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Please verify your email and then press the button."),
            ElevatedButton(
              onPressed: checkEmailVerified,
              child: Text("I Verified My Email"),
            ),
          ],
        ),
      ),
    );
  }
}
