import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartMetricsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Card for Heart pressure
        _buildHeartMetricCard(
          icon: Icons.favorite,
          label: 'Heart pressure',
          value: '123 / 80',
          color: Colors.red,
        ),
        // Card for Heart rhythm
        _buildHeartMetricCard(
          icon: Icons.monitor_heart_outlined,
          label: 'Heart rhythm',
          value: '67 / min',
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildHeartMetricCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
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
          color: Colors.grey.shade200, // Grey background
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Ensure content is aligned to the left
          children: [
            Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Colors.white, // Card background for the icon
                shape: BoxShape.circle, // Circular background for the icon
              ),
              child: Icon(icon, size: 30.sp, color: color),
            ),
            SizedBox(height: 8.h),
            Text(label, style: TextStyle(fontSize: 14.sp)),
            Text(value,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
