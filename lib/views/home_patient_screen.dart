import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/controller/authentication_controller.dart';

import '../constant.dart';
import 'mainpages/add_consultation.dart';
import 'mainpages/hospitals.dart';
import 'mainpages/profile.dart';
import 'specialized.dart';

class HomePatientScreen extends StatelessWidget {
  HomePatientScreen({super.key});
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "مرحبا يا ${controller.currentUserName}",
          style: TextStyle(color: kDarkBlueColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.person_2_rounded,
            color: kDarkBlueColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "الأقسام",
                    style: TextStyle(color: kDarkBlueColor, fontSize: 25),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('برجاء الاختيار'),
                              alignment: Alignment.center,
                              content: Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    ListTileWidget(
                                        onTap: () {
                                          Get.to(() => Hospitals());
                                        },
                                        text: "مستشفى"),
                                    ListTileWidget(onTap: () {}, text: "عيادة"),
                                    ListTileWidget(
                                        onTap: () {}, text: "مراكز طبية"),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 10,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/catigories.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //-------------------
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      elevation: 10,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/lab.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      elevation: 10,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/about_hospital.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //-------------------
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      elevation: 10,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/support.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "إضافة استشارة",
                    style: TextStyle(color: kDarkBlueColor, fontSize: 25),
                  )
                ],
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Card(
                    elevation: 10,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "قم بإضافة استشارة",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(AddConsultation());
                            },
                            icon: Icon(
                              Icons.add,
                              size: 50,
                              color: kDarkBlueColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "الاستشارات المجاب عنها",
                    style: TextStyle(color: kDarkBlueColor, fontSize: 25),
                  )
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_sharp,
                      size: 100,
                      color: kDarkBlueColor,
                    ),
                    Text("عفوا, لا توجد استشارات مجاب عنها حاليا")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
