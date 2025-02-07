import "package:Symprax/core/services/servisess.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Customfirsttitle extends StatelessWidget {
  final String title;
  const Customfirsttitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "ar"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: const Icon(
                  EvaIcons.briefcase,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    height: 0.5,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BebasNeue",
                  ),
                ),
              ),
            ],
          )
        : Row(children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: TextStyle(
                  height: 0.5,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "BebasNeue",
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: const Icon(
                EvaIcons.briefcase,
                color: Colors.white,
              ),
            ),
          ]);
  }
}
