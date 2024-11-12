import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeWidget extends StatefulWidget {
  @override
  _CustomizeWidgetState createState() => _CustomizeWidgetState();
}

class _CustomizeWidgetState extends State<CustomizeWidget> {
  // Variables to track the state of each icon
  bool isWifiClicked = false;
  bool isSettingsClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w), // Less padding around the container to ensure the image fits well
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r), // Responsive border radius
      ),
      child: Stack(
        alignment: Alignment.bottomRight, // Position the icons at the bottom right
        children: [
          // Image of the device (fitness tracker)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r), // Responsive rounded corners for the image
            child: Container(
              width: 350.w, // Set the image width
              height: 200.h, // Set the height to give more space for the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/watch.jpg'), // Keep the specified image asset path
                  fit: BoxFit.cover, // Ensure the image covers the area without distortion
                ),
              ),
            ),
          ),
          // Icons at the bottom right of the image with white circular background
          Padding(
            padding: EdgeInsets.all(8.w), // Padding around the icons
            child: Row(
              children: [
                // Wifi icon with conditional background
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isWifiClicked = !isWifiClicked; // Toggle the state for WiFi
                      if (isWifiClicked) {
                        isSettingsClicked = false; // Reset Settings icon if WiFi is clicked
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w), // Add padding inside the circle
                    decoration: BoxDecoration(
                      color: isWifiClicked ? Colors.transparent : Colors.white, // WiFi background transparent when clicked
                      shape: BoxShape.circle, // Circular shape
                    ),
                    child: Icon(Icons.wifi, size: 30.sp, color: Colors.black), // Wifi icon with black color
                  ),
                ),
                SizedBox(width: 10.w), // Space between icons
                // Settings icon with conditional background
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSettingsClicked = !isSettingsClicked; // Toggle the state for Settings
                      if (isSettingsClicked) {
                        isWifiClicked = false; // Reset WiFi icon if Settings is clicked
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w), // Add padding inside the circle
                    decoration: BoxDecoration(
                      color: isSettingsClicked ? Colors.transparent : Colors.white, // Settings background transparent when clicked
                      shape: BoxShape.circle, // Circular shape
                    ),
                    child: Icon(Icons.settings, size: 30.sp, color: Colors.black), // Settings icon with black color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}