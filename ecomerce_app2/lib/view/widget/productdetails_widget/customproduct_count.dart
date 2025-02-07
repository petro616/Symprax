import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomproductCount extends StatelessWidget {
  final String startText;
  final void Function()? onAdd;
  final void Function()? onMinus;
  final String count;
  const CustomproductCount(
      {super.key,
      required this.startText,
      required this.onAdd,
      required this.onMinus,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, top: 10.h),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            startText,
            style: TextStyle(
                color: Color.fromARGB(255, 51, 94, 116),
                fontSize: 17.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            child: MaterialButton(
              minWidth: 1.w,
              padding: EdgeInsets.all(3.w),
              height: 12.h,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r)),
              onPressed: onAdd,
              child: Icon(
                EvaIcons.plus,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h, left: 6.w),
            height: 26.h,
            width: 35.w,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 51, 94, 116), width: 2.w),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              textAlign: TextAlign.center,
              count,
              style: TextStyle(
                  height: 1.1.h,
                  color: Colors.blueGrey,
                  fontFamily: "BebasNeue",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4.w),
            child: MaterialButton(
              minWidth: 1.w,
              padding: EdgeInsets.all(3.w),
              height: 12.h,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r)),
              onPressed: onMinus,
              child: const Icon(
                EvaIcons.minus,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
