import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeWidget extends StatefulWidget {
  @override
  _CustomizeWidgetState createState() => _CustomizeWidgetState();
}

class _CustomizeWidgetState extends State<CustomizeWidget> {
  // To track which icon is selected
  bool isWiFiSelected = false;
  bool isSettingsSelected = false;

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
                  onTap: () {
                    setState(() {
                      // Toggle WiFi selection state
                      isWiFiSelected = !isWiFiSelected;
                      // Deselect Settings icon if WiFi is selected
                      if (isWiFiSelected) {
                        isSettingsSelected = false;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: isWiFiSelected ? Colors.white : Colors.transparent, // Show white background only when selected
                      shape: BoxShape.circle,
                      border: isWiFiSelected
                          ? Border.all(
                        color: Colors.blue, // Blue border when selected
                        width: 2.w,
                      )
                          : null, // No border when unselected
                    ),
                    child: Icon(
                      Icons.wifi,
                      size: 30.sp,
                      color: isWiFiSelected ? Colors.blue : Colors.black, // Change icon color when selected
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                // Settings Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle Settings selection state
                      isSettingsSelected = !isSettingsSelected;
                      // Deselect WiFi icon if Settings is selected
                      if (isSettingsSelected) {
                        isWiFiSelected = false;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: isSettingsSelected ? Colors.white : Colors.transparent, // Show white background only when selected
                      shape: BoxShape.circle,
                      border: isSettingsSelected
                          ? Border.all(
                        color: Colors.blue, // Blue border when selected
                        width: 2.w,
                      )
                          : null, // No border when unselected
                    ),
                    child: Icon(
                      Icons.settings,
                      size: 30.sp,
                      color: isSettingsSelected ? Colors.blue : Colors.black, // Change icon color when selected
                    ),
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