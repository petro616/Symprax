import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bill extends StatelessWidget {
  final String title;
  final String price;
  final Color pricecolor;
  const Bill(
      {super.key,
      required this.title,
      required this.price,
      required this.pricecolor});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 6.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 2.5.w),
              child: Text(
                price,
                style: TextStyle(
                  color: pricecolor,
                  fontSize: 18.sp,
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
