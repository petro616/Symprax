import "package:AdminApp/core/constant/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Customtextform extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final TextEditingController mycontroller;
  final String? Function(String?) validatores;
  final TextInputType keyboardTypeform;
  final bool? obscuretype;
  final void Function()? onTap;
  const Customtextform(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.mycontroller,
      required this.validatores,
      required this.keyboardTypeform,
      this.obscuretype,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        obscureText: obscuretype == null || obscuretype == false ? false : true,
        keyboardType: keyboardTypeform,
        validator: validatores,
        controller: mycontroller,
        decoration: InputDecoration(
            // isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
            hintText: hint,
            hintStyle: TextStyle(
                color: AppColor.colorLoginTitleSub,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                size: 21.w,
                color: AppColor.colorLoginTitleSub,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(label)),
            labelStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColor.colorLoginTitleSub,
                fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(
                    color: AppColor.colorLoginTitleMain, width: 1.5.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 155, 89, 66), width: 1.5.w))),
      ),
    );
  }
}
