import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthapp/ui/screens/heart_health.dart';

class ConnectButton extends StatefulWidget {
  @override
  _ConnectButtonState createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton>
    with TickerProviderStateMixin {
  bool isSwapped = false; // Controls icon swap for animation
  double _swipeOffset = 0.0; // Tracks the swipe position
  late AnimationController _animationController;

  // Flag to track if the swipe has exceeded the threshold
  bool _isSwipedBeyondThreshold = false;

  // Threshold to trigger navigation when swipe is greater than this value
  final double swipeThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller for blinking effect
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Duration for the blink
    )..repeat(reverse: true); // Make it repeat indefinitely with reverse effect
  }

  void navigateWithAnimation() {
    setState(() {
      isSwapped = true; // Swap icons before navigation
      _isSwipedBeyondThreshold = true; // Set the flag to hide the text
    });

    Future.delayed(Duration(milliseconds: 300), () {
      Get.to(() => HeartHealth()); // Navigate to HeartHealth screen
      setState(() {
        isSwapped = false; // Reset icon positions after navigation
        _swipeOffset = 0.0; // Reset swipe offset
        _isSwipedBeyondThreshold = false; // Reset visibility flag
      });
    });
  }

  void onHorizontalSwipe(DragUpdateDetails details) {
    setState(() {
      // Update the swipe offset, ensuring it only moves forward (positive direction)
      _swipeOffset += details.primaryDelta!;

      // Ensure the swipe offset only moves forward (non-negative values)
      _swipeOffset = _swipeOffset.clamp(
          0.0, double.infinity); // Allow only forward movement
    });
  }

  void onSwipeEnd(DragEndDetails details) {
    // Trigger navigation only if swipe offset exceeds the threshold
    if (_swipeOffset > swipeThreshold) {
      navigateWithAnimation();
    } else {
      setState(() {
        _swipeOffset = 0.0; // Reset position if swipe is not enough
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose animation controller when done
    super.dispose();
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
            // Center text with arrows, visibility based on swipe threshold
            Visibility(
              visible: !_isSwipedBeyondThreshold,
              // Hide when threshold exceeded
              child: Center(child: _buildConnectText()),
            ),
            // Right icon, fixed position with conditional color based on swap state
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

  // Updated _buildConnectText with blinking effect using AnimationController
  Widget _buildConnectText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Connect',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 4.0),
        // Using AnimatedBuilder to apply the blinking effect
        ...[Colors.black38, Colors.black54, Colors.black].map(
          (color) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                // Control the opacity with the animation value
                return Opacity(
                  opacity: _animationController.value,
                  child: Text(
                    '>',
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
