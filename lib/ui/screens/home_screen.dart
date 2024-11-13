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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
            child: HeaderWidget(), // Use your custom HeaderWidget as the AppBar
          ),
          body: SingleChildScrollView( // Allows scrolling
            child: Padding(
              padding: EdgeInsets.all(16.0.w), // Ensure the padding works for all screen sizes
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: BatteryWidget()),
                    ],
                  ),
                  SizedBox(height: 20.h), // Adds vertical spacing
                  CustomizeWidget(),
                  SizedBox(height: 20.h), // Adds vertical spacing
                  Center(child: ConnectButton()), // Center the ConnectButton at the end
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}