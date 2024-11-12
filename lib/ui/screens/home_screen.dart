import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/battery_widget.dart';
import '../widgets/customize_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Set the design size according to your UI design (width x height)
      minTextAdapt: true,         // Optional: Ensures text adapts to the screen size
      splitScreenMode: true,      // Optional: Allows the app to handle split-screen mode better
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.w), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h), // Responsive height
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.r, // Responsive radius
                            backgroundImage: AssetImage('images/person_seven.png'),
                          ),
                          SizedBox(width: 10.w), // Responsive width
                          Text(
                            'Hello, Jacob!',
                            style: TextStyle(
                              fontSize: 20.sp, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r), // Responsive padding
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.notifications_none,
                              size: 30.sp, // Responsive icon size
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            right: 4.r,
                            top: 4.r,
                            child: Container(
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 2.r, // Size of the red dot
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h), // Responsive height
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tracking',
                        style: TextStyle(
                          fontSize: 40.sp, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'your Heart',
                        style: TextStyle(
                          fontSize: 40.sp, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h), // Responsive height
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: BatteryWidget()),
                      // Removed HeartTrackingWidget here
                    ],
                  ),
                  SizedBox(height: 20.h), // Responsive height
                  CustomizeWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}