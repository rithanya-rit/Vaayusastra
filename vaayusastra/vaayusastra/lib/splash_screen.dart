import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import your login page

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to the login page
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Use your logo or image here
            Image.asset('assets/flash.jpeg', width: 150, height: 150),
            SizedBox(height: 24),
            Text(
              'Welcome to Your App',
              style: TextStyle(
                color: Colors.black, // Text color set to black for contrast
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black), // Spinner color set to black
            ),
          ],
        ),
      ),
    );
  }
}
