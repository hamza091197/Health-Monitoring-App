import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.w),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage('images/person_five.png'),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Robert Fox', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              Text('Cardiologist', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
            ],
          ),
          Spacer(),
          ...['message_rounded', 'local_phone_outlined'].map((iconName) => Padding(
            padding: EdgeInsets.only(left: 9.w),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconName == 'message_rounded' ? Icons.message_rounded : Icons.local_phone_outlined,
                color: iconName == 'message_rounded' ? Colors.blue : Colors.green,
                size: 24.sp,
              ),
            ),
          )),
        ],
      ),
    );
  }
}