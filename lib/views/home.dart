import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/views/mainpages/profile.dart';

import '../constant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: Text(
            "مرحبا دكتور محمد",
            style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: bgColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: Image.asset("assets/images/profilelogo.png"),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/images/bkcases.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "عدد الحالات",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            "0",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "آخر الحالات",
                      style: TextStyle(fontSize: 25, color: darkColor),
                    ),
                    Image.asset("assets/images/latestcases.png")
                  ],
                ),
              ),
              Center(
                child: Image.asset("assets/images/notfoundcases.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: darkColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            "متابعة الحالات",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: darkColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "الرد على الاستشارات",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [],
                    ),
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
