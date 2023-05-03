import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../specialized.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "قم بإختيار المستشفى",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ListTileWidget(
                onTap: () {
                  Get.to(() => Specialized());
                },
                text: "مستشفى الأمومة"),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(onTap: () {}, text: "مستشفى عين شمس التخصصي"),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(onTap: () {}, text: "مستشفى دار الشفاء"),
            SizedBox(
              height: 10,
            ),

            ListTileWidget(onTap: () {}, text: "مستشفى سان بولا"),
            SizedBox(
              height: 10,
            ),

            ListTileWidget(onTap: () {}, text: "مستشفى شفا"),
            SizedBox(
              height: 10,
            ),

            ListTileWidget(onTap: () {}, text: "مستشفى مدينة نصر"),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(onTap: () {}, text: "مستشفى رابعة العدوية"),
            //--------------
          ],
        ),
      )),
    );
  }
}
