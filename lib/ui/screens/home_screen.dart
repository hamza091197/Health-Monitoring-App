import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/ui/widgets/header_widget.dart';
import '../widgets/battery_widget.dart';
import '../widgets/customize_widget.dart';
import '../widgets/connect_button.dart'; // Import the ConnectButton

class HomeScreen extends StatelessWidget {
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
                SizedBox(height: 40.h),
                HeaderWidget(),
                SizedBox(height: 20.h),
                Text(
                  'Tracking your Heart',
                  style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                BatteryWidget(),
                SizedBox(height: 20.h),
                CustomizeWidget(),
                SizedBox(height: 20.h),
                Center(child: ConnectButton()),
              ],
            ),
          ),
        );
      },
    );
  }
}