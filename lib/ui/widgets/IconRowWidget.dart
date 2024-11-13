import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconRowWidget extends StatefulWidget {
  @override
  IconRowWidgetState createState() => IconRowWidgetState();
}

class IconRowWidgetState extends State<IconRowWidget> {
  // Track the selected icon index
  int selectedIndex = -1;

  Widget buildIcon(IconData icon, Color bgColor, Color iconColor, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected icon index on tap
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.black : bgColor, // Change background color based on selection
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.white : iconColor, // Change icon color based on selection
          size: 24.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h), // Removed horizontal padding
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIcon(Icons.home, Colors.grey.shade200, Colors.black, 0),
          buildIcon(Icons.add, Colors.grey.shade200, Colors.black, 1),
          buildIcon(Icons.favorite_border, Colors.grey.shade200, Colors.black, 2),
          buildIcon(Icons.person_outline, Colors.grey.shade200, Colors.black, 3),
        ],
      ),
    );
  }
}