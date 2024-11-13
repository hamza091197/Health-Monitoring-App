import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: AssetImage('images/person_seven.png'),
            ),
            SizedBox(width: 10.w),
            Text('Hello, Jacob!', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          ],
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none,
                size: 30.sp,
                color: Colors.black,
              ),
            ),
            Positioned(
              right: 4.r,
              top: 4.r,
              child: CircleAvatar(radius: 2.r, backgroundColor: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
