import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/doctor_contact_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/health_status_widget.dart';
import '../widgets/heart_metrics_widget.dart';

class HeartHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                SizedBox(height: 10.h), // Increase the space between HeaderWidget and the title
                Text(
                  'Heart Health',
                  style: TextStyle(
                    fontSize: 30.sp,  // Set the font size using ScreenUtil for responsiveness
                    fontWeight: FontWeight.bold,  // Make the text bold
                  ),
                ),
                SizedBox(height: 20.h),
                HealthStatusWidget(),
                SizedBox(height: 20.h),
                HeartMetricsWidget(),
                SizedBox(height: 20.h),
                DoctorContactWidget(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBarWidget(),
        );
      },
    );
  }
}