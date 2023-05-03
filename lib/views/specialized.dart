import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../controller/emergency_controller.dart';
import 'Catigories_screens/emergancy.dart';

class Specialized extends StatelessWidget {
  Specialized({super.key});
  EmergencyController controller = Get.put(EmergencyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "الأقسام",
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
                  controller.getDoctors();
                  Get.to(EmergancyScreen());
                },
                text: "قسم الطوارئ"),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(onTap: () {}, text: "قسم الحضانة"),
            SizedBox(
              height: 10,
            ),

            ListTileWidget(onTap: () {}, text: "قسم العناية المركزة"),
            SizedBox(
              height: 10,
            ),

            ListTileWidget(onTap: () {}, text: "قسم النساء والتوليد"),
            SizedBox(
              height: 10,
            ),

            ListTileWidget(onTap: () {}, text: "قسم الباطنة"),
            //--------------
          ],
        ),
      )),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: Colors.black),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Icon(
        Icons.arrow_right_sharp,
        color: Colors.black,
      ),
    );
  }
}
