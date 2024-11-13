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

  // Method to handle the common logic for both icons
  void _toggleIconState(String iconType) {
    setState(() {
      if (iconType == 'wifi') {
        isWifiClicked = !isWifiClicked;
        if (isWifiClicked) isSettingsClicked = false; // Reset Settings if WiFi clicked
      } else {
        isSettingsClicked = !isSettingsClicked;
        if (isSettingsClicked) isWifiClicked = false; // Reset WiFi if Settings clicked
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Image of the device (fitness tracker)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: 350.w,
              height: 200.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/fitness.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Icons at the bottom right of the image
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                // WiFi Icon
                GestureDetector(
                  onTap: () => _toggleIconState('wifi'),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: isWifiClicked ? Colors.transparent : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isWifiClicked ? Colors.black : Colors.transparent,
                        width: 2.w,
                      ),
                    ),
                    child: Icon(Icons.wifi, size: 30.sp, color: Colors.black),
                  ),
                ),
                SizedBox(width: 10.w),
                // Settings Icon
                GestureDetector(
                  onTap: () => _toggleIconState('settings'),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: isSettingsClicked ? Colors.transparent : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSettingsClicked ? Colors.black : Colors.transparent,
                        width: 2.w,
                      ),
                    ),
                    child: Icon(Icons.settings, size: 30.sp, color: Colors.black),
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