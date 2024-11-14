import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthapp/ui/screens/heart_health.dart';

class ConnectButton extends StatefulWidget {
  @override
  _ConnectButtonState createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  bool isSwapped = false; // Controls icon swap for animation
  double _swipeOffset = 0.0; // Tracks the swipe position

  void navigateWithAnimation() {
    setState(() {
      isSwapped = true; // Swap icons before navigation
    });

    Future.delayed(Duration(milliseconds: 300), () {
      Get.to(() => HeartHealth()); // Navigate to HeartHealth screen
      setState(() {
        isSwapped = false; // Reset icon positions after navigation
        _swipeOffset = 0.0; // Reset swipe offset
      });
    });
  }

  void onHorizontalSwipe(DragUpdateDetails details) {
    setState(() {
      _swipeOffset += details.primaryDelta!;
      // Prevent swipe from moving too far left or right
      _swipeOffset = _swipeOffset.clamp(-50.0, 150.0); // Example bounds
    });
  }

  void onSwipeEnd(DragEndDetails details) {
    if (_swipeOffset > 100) {
      // Threshold for swiping
      navigateWithAnimation();
    } else {
      setState(() {
        _swipeOffset = 0.0; // Reset position if swipe is not enough
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: onHorizontalSwipe, // Detect horizontal swipe
      onHorizontalDragEnd: onSwipeEnd, // Trigger action when swipe ends
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Color(0xFFFFE79B), // Light yellow background color
          borderRadius: BorderRadius.circular(50), // Rounded corners
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Left icon, positioned based on swipe offset
            Positioned(
              left: _swipeOffset,
              child: _buildIcon(
                  Icons.watch, Colors.black), // Black icon on the left
            ),
            // Center text with arrows
            Center(child: _buildConnectText()),
            // Right icon, fixed position with conditional color based on swipe status
            Positioned(
              right: 0,
              child: _buildIcon(
                Icons.watch,
                isSwapped
                    ? Colors.black
                    : Colors.grey.shade400, // Change color based on swap state
              ),
            ),
          ],
        ),
      ),
    );
  }

// Updated _buildIcon method to create a rounded card with a circular icon background
  Widget _buildIcon(IconData icon, Color color) {
    return Card(
      elevation: 4.0, // Adds shadow for card effect
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.r), // Rounded corners for the Card
      ),
      child: Container(
        padding: EdgeInsets.all(10.0), // Padding inside the container
        decoration: BoxDecoration(
          color: Colors.white, // White background for the icon container
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 24.0, // Icon size
          color: color, // Icon color
        ),
      ),
    );
  }

  Widget _buildConnectText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
