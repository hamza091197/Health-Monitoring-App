import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartMetricsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(Icons.favorite, size: 30.sp, color: Colors.red),
            Text('Heart pressure', style: TextStyle(fontSize: 14.sp)),
            Text('123 / 80', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.monitor_heart_outlined, size: 30.sp, color: Colors.blue),
            Text('Heart rhythm', style: TextStyle(fontSize: 14.sp)),
            Text('67 / min', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
