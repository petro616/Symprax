import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardHome extends StatelessWidget {
  final String url;
  final String title;
  final void Function()? onclick;
  const CardHome(
      {super.key, required this.url, required this.title, this.onclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              url,
              fit: BoxFit.cover,
              height: 85.h,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
