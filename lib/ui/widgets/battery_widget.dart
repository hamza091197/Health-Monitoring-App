import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BatteryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Wrap the content in a scrollable view
      child: Align(
        alignment: Alignment.center, // Align the widget to the left side
        child: Container(
          width: 160.w, // Reduced width for shrinking both sides
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w), // Adjusted padding
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade100, // Lighter green background color
            borderRadius: BorderRadius.circular(40.r), // Responsive border radius
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '86%',
                style: TextStyle(
                  fontSize: 32.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'battery',
                style: TextStyle(
                  fontSize: 14.sp, // Responsive font size
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20.h), // Responsive spacing

              // White background container for the bolt icon and bars
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  borderRadius: BorderRadius.circular(40.r), // Rounded corners
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.bolt,
                      size: 30.sp,
                      color: Colors.lightGreen.shade100, // Lighter green color for bolt
                    ),
                    SizedBox(height: 20.h), // Responsive spacing

                    // List of bars
                    Column(
                      children: List.generate(
                        6,
                            (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Container(
                            width: 50.w, // Responsive width for bars
                            height: 8.h, // Responsive height for bars
                            color: Colors.lightGreen.shade100, // Lighter green for bars
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}