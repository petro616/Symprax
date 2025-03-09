/*import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showdialograting(BuildContext context, String ordersid) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Your rate is important for us',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: AppColor.colorscaffoldLogin,
          fontWeight: FontWeight.bold,
        ),
      ),
      image: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "assets/images/photo_2024-08-21_10-37-43.jpg",
          fit: BoxFit.cover,
          height: 170,
          width: 80,
        ),
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.colorscaffoldLogin,
          fontSize: 20),
      commentHint: 'Tell us about problems',
      onSubmitted: (response) {
        ArchieveController controller = Get.find();
        controller.submitRating(ordersid, response.rating, response.comment);
      },
    ),
  );
}*/
