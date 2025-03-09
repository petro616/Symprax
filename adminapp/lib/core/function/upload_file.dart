import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

uploadImageFromCamera() async {
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

uploadfileAnyThing([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : [
              "svg",
              "SVG",
              "png",
              "PNG",
              "jpg",
              "JPG",
              "jpeg",
              "JPEG",
              "gif",
              "GIF"
            ]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

uploadmultifilesanything() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(allowMultiple: true);

  if (result != null) {
    // ignore: unused_local_variable
    List<File> files = result.paths.map((path) => File(path!)).toList();
  } else {
    return null;
  }
}

showbuttonmenu(uploadImageFromCamera(), uploadfileAnyThing()) {
  Get.bottomSheet(
      Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Choose Image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                ListTile(
                  onTap: () {
                    uploadImageFromCamera();
                    Get.back();
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text(
                    "From Camera",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ListTile(
                  onTap: () {
                    uploadfileAnyThing();
                    Get.back();
                  },
                  leading: Icon(Icons.image),
                  title: Text(
                    "From Gallery",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Colors.white);
}
