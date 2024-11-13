import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:healthapp/splash_screen.dart';
import 'package:healthapp/ui/screens/heart_health.dart';

import '../screens/home_screen.dart';

class ConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the SplashScreen when the button is tapped
        Get.to(() => HeartHealth());
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFE79B),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIcon(Icons.watch, Colors.black), // Left-end icon
            _buildConnectText(), // Center text with arrows
            _buildIcon(Icons.watch, Colors.grey.shade400), // Right-end icon
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon, color: color),
    );
  }

  Widget _buildConnectText() {
    return Row(
      children: [
        Text('Connect', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(width: 4.0),
        ...[Colors.black38, Colors.black54, Colors.black].map(
              (color) => Text('>', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}