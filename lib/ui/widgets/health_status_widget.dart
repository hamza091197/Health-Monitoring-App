import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthapp/ui/screens/home_screen.dart';

class HealthStatusWidget extends StatefulWidget {
  @override
  _HealthStatusWidgetState createState() => _HealthStatusWidgetState();
}

class _HealthStatusWidgetState extends State<HealthStatusWidget> {
  bool _isVisible = true; // Track visibility of the image

  @override
  void initState() {
    super.initState();
    _startFadeAnimation();
  }

  // Function to start fade in and fade out animation
  void _startFadeAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = !_isVisible; // Toggle visibility
      });

      // Continue toggling the visibility every 500 milliseconds for the fade effect
      Future.delayed(Duration(milliseconds: 500), _startFadeAnimation);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Card(
      elevation: 4, // Adds shadow for card effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h, // Vertical padding based on screen height
          horizontal: 24.w, // Horizontal padding based on screen width
        ),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align to the left
          children: [
            // Left side: Icon, text, and button
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIcon(),
                  SizedBox(height: 8.h),
                  _buildText(),
                  SizedBox(height: 8.h),
                  _buildButton(),
                ],
              ),
            ),
            // Right side: Heart image with fade effect
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0, // Fade in/out effect
              duration: Duration(milliseconds: 500), // Duration of fade effect (less than 1 second)
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r), // Rounded corners
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'images/heart_model.png',
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(Icons.heart_broken_outlined, color: Colors.black, size: 24.sp),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Health',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 4.h),
        // Using \n to add a line break within a single Text widget
        Text(
          'Last diagnosis of heart\n3 days ago',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return OutlinedButton(
      onPressed: () {
        Get.to(() => HomeScreen());
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Colors.black, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      ),
      child: Text('Diagnostic',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp)),
    );
  }
}