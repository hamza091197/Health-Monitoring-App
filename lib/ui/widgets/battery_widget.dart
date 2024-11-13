import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BatteryWidget extends StatefulWidget {
  @override
  BatteryWidgetState createState() => BatteryWidgetState();
}

class BatteryWidgetState extends State<BatteryWidget> {
  List<int> visibleItems = [];
  List<int> staticVisibleItems = []; // New list for static lines
  int index = 0;
  Timer? timer; // Make timer nullable
  late Battery _battery;
  bool isCharging = false;
  int batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    _battery = Battery();
    _checkBatteryStatus();

    // Listen to battery state changes
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        isCharging = state == BatteryState.charging || state == BatteryState.full;
        if (!isCharging) {
          // If not charging, reset visible items and show static lines
          visibleItems.clear(); // Clear animated visible items
          staticVisibleItems = List.generate(6, (index) => index); // Show all lines
          index = 0; // Reset index
          timer?.cancel(); // Stop the timer if it's running
        } else {
          // Start animation if charging
          staticVisibleItems.clear(); // Clear static visible items
          startStaggeredAnimation();
        }
      });
    });
  }

  // Check the initial battery level
  Future<void> _checkBatteryStatus() async {
    batteryLevel = await _battery.batteryLevel;
    setState(() {}); // Update UI with the battery level
  }

  // Start the staggered animation if charging
  void startStaggeredAnimation() {
    // Cancel any existing timer
    timer?.cancel();
    index = 0; // Reset index
    visibleItems.clear(); // Clear visible items

    timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
      setState(() {
        if (index < 6) {
          visibleItems.add(index++);
        } else {
          index = 0;
          visibleItems.clear();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer if it exists
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              width: 120.w,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Column(
                children: [
                  Text('$batteryLevel%',
                      style: TextStyle(
                          fontSize: 32.sp, fontWeight: FontWeight.bold)),
                  Text('battery',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black54)),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Column(
                      children: [
                        Icon(Icons.bolt,
                            size: 30.sp, color: Colors.blue.shade100),
                        SizedBox(height: 20.h),
                        // Show lines based on charging status
                        ...List.generate(
                          6,
                              (lineIndex) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: AnimatedOpacity(
                              opacity: visibleItems.contains(lineIndex) || staticVisibleItems.contains(lineIndex) ? 1.0 : 0.0,
                              duration: isCharging ? Duration(milliseconds: 300) : Duration.zero, // No animation when not charging
                              child: Container(
                                width: 50.w,
                                height: 8.h,
                                color: Colors.blue.shade100,
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
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset('images/watch.jpg',
                  width: 200.w, height: 250.h, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}