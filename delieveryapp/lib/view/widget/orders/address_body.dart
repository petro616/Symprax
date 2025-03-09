import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressBody extends StatelessWidget {
  final String body;
  const AddressBody({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        body,
        style: TextStyle(
            fontSize: 13.sp,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
