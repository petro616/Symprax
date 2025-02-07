import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrailingListtile extends StatelessWidget {
  final void Function() onConfirmDefaultDialog;
  final void Function() onPressedIconButtonEdit;
  const TrailingListtile(
      {super.key,
      required this.onConfirmDefaultDialog,
      required this.onPressedIconButtonEdit});

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
        IconButton(
            onPressed: onPressedIconButtonEdit,
            icon: Icon(
              Icons.edit,
              color: Colors.blueGrey,
            )),
      ],
    );
  }
}
