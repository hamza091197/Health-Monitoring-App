import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/IconRowWidget.dart';
import '../widgets/doctor_contact_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/health_status_widget.dart';
import '../widgets/heart_metrics_widget.dart';

class HeartHealth extends StatefulWidget {
  @override
  _HeartHealthState createState() => _HeartHealthState();
}

class _HeartHealthState extends State<HeartHealth> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                SizedBox(height: 40.h), // Adds extra space at the top
                HeaderWidget(),
                SizedBox(height: 20.h), // Spacing after HeaderWidget

                // Adding scale transition to the title text
                ScaleTransition(
                  scale: _animation,
                  child: Text(
                    'Heart Health',
                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 20.h), // Space between title and content
                HealthStatusWidget(),
                SizedBox(height: 20.h),
                HeartMetricsWidget(),
                SizedBox(height: 20.h),
                DoctorContactWidget(),
                SizedBox(height: 20.h),
                Center(child: IconRowWidget()),
              ],
            ),
          ),
        );
      },
    );
  }
}