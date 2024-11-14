import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthapp/ui/screens/heart_health.dart';

class ConnectButton extends StatefulWidget {
  @override
  _ConnectButtonState createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  bool isSwapped = false; // Controls icon swap for animation

  void navigateWithAnimation() {
    setState(() {
      isSwapped = true; // Swap icons before navigation
    });

    Future.delayed(Duration(milliseconds: 300), () {
      Get.to(() => HeartHealth()); // Navigate to HeartHealth screen
      setState(() {
        isSwapped = false; // Reset icon positions after navigation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateWithAnimation, // Trigger animation and navigation
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFE79B),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSwapped
                ? _buildIcon(Icons.watch, Colors.grey.shade400)
                : _buildIcon(Icons.watch, Colors.black), // Left-end icon
            _buildConnectText(), // Center text with arrows
            isSwapped
                ? _buildIcon(Icons.watch, Colors.black)
                : _buildIcon(Icons.watch, Colors.grey.shade400), // Right-end icon
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color color) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon, color: color),
    );
  }

  Widget _buildConnectText() {
    return Row(
      children: [
        Text(
          'Connect',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 4.0),
        ...[Colors.black38, Colors.black54, Colors.black].map(
              (color) => Text(
            '>',
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}