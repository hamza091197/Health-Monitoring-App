import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30.r, backgroundImage: AssetImage('images/person_five.png')),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Robert Fox', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              Text('Cardiologist', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
            ],
          ),
          Spacer(),
          Icon(Icons.message, color: Colors.blue, size: 24.sp),
          SizedBox(width: 16.w),
          Icon(Icons.phone, color: Colors.green, size: 24.sp),
        ],
      ),
    );
  }
}