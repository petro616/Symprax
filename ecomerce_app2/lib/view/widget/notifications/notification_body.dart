import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBody extends StatelessWidget {
  final String title;
  const NotificationBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      child: Text(
        title,
        style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
