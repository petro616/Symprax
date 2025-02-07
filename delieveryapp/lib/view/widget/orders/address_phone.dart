import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressPhone extends StatelessWidget {
  final String phone;
  const AddressPhone({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        phone,
        style: TextStyle(
            height: 2.h,
            fontSize: 13.sp,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
