import "package:AdminApp/core/constant/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Customtextformglobal extends StatelessWidget {
  final String hint;
  final bool readOnly;
  final String label;
  final IconData icon;
  final TextEditingController mycontroller;
  final String? Function(String?) validatores;
  final TextInputType keyboardTypeform;
  final bool? obscuretype;
  final void Function()? onTap;
  const Customtextformglobal(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.mycontroller,
      required this.validatores,
      required this.keyboardTypeform,
      this.obscuretype,
      this.onTap,
      required this.readOnly});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        readOnly: readOnly,
        obscureText: obscuretype == null || obscuretype == false ? false : true,
        keyboardType: keyboardTypeform,
        validator: validatores,
        controller: mycontroller,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
            hintText: hint,
            hintStyle: TextStyle(
                color: AppColor.colorLoginTitleSub,
                fontWeight: FontWeight.bold,
                fontSize: 11.5.sp),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                color: AppColor.colorLoginTitleSub,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(label)),
            labelStyle: TextStyle(
                fontSize: 16.5.sp,
                color: AppColor.colorLoginTitleSub,
                fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                    color: AppColor.colorLoginTitleMain, width: 1.5.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 155, 89, 66), width: 1.5.w))),
      ),
    );
  }
}
