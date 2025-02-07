import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailingListtileForItems extends StatelessWidget {
  final void Function() onConfirmDefaultDialog;
  const TrailingListtileForItems(
      {super.key, required this.onConfirmDefaultDialog});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Warning",
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  middleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  middleText: "Are you sure you want to delete",
                  onCancel: () {},
                  cancelTextColor: Colors.grey,
                  confirmTextColor: Colors.blueGrey,
                  buttonColor: Colors.grey,
                  onConfirm: onConfirmDefaultDialog);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ],
    );
  }
}
