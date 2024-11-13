import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BatteryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.centerLeft,
        // Aligning the entire content to the left
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // Align the first widget to the left
          children: [
            Container(
              width: 120.w,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('86%',
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
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.bolt,
                            size: 30.sp, color: Colors.blue.shade100),
                        SizedBox(height: 20.h),
                        ...List.generate(
                          6,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Container(
                              width: 50.w,
                              height: 8.h,
                              color: Colors.blue.shade100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // This widget will push the image to the right side
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                'images/watch.jpg',
                width: 200.w,
                height: 250.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
