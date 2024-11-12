import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthapp/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Start with the SplashScreen
    );
  }
}