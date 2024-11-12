import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthapp/ui/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  // Method to simulate delay and navigate to the HomeScreen after 2 seconds
  void _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds
    Get.to(() => HomeScreen()); // Navigate to HomeScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Customize background color
      body: Center(
        child: Image.asset(
          'images/watch.jpg', // Replace with your image asset path
          fit: BoxFit.cover, // Make the image cover the entire screen
          width: double.infinity, // Ensure the image takes up the full width
          height: double.infinity, // Ensure the image takes up the full height
        ),
      ),
    );
  }
}