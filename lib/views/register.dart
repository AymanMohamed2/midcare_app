import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/controller/authentication_controller.dart';
import 'package:medicare_app/views/home_patient_screen.dart';
import 'package:medicare_app/views/login.dart';

import '../constant.dart';
import '../widgets/emailfield02.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "إنشاء حساب جديد",
          style: TextStyle(color: kDarkBlueColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: kDarkBlueColor),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: Get.size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      EmailField02(
                        title: Text("اسم المريض"),
                        controller: nameController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.person,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        title: Text("رقم هاتف المريض"),
                        controller: phoneNumberController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboradType: TextInputType.phone,
                        leading: Icon(
                          Icons.phone,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        title: Text("النوع"),
                        controller: ganderController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.male,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        title: Text("البريد الالكتروني"),
                        controller: emailController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.email,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        validator: (value) {
                          if (value < 8) {
                            return "لا يجب أن يكون الباسورد أقل من 8 أحرف ورموز";
                          }
                        },
                        title: Text("كلمة المرور"),
                        controller: passwordController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.lock,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.size.width * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kDarkBlueColor,
                        padding: EdgeInsets.symmetric(
                          vertical: v_btn_padding,
                        )),
                    onPressed: () {
                      if (passwordController.text.trim().length >= 8) {
                        controller
                            .createPatientAccount(
                                emailController.text,
                                nameController.text,
                                passwordController.text,
                                phoneNumberController.text,
                                ganderController.text)
                            .then((value) {
                          Get.offAll(HomePatientScreen());
                        });
                        Get.snackbar("نجح", "تم إنشاء الحساب بنجاح",
                            backgroundColor: Colors.green,
                            colorText: Colors.white);
                      } else if (passwordController.text.trim().length < 8) {
                        Get.snackbar("خطأ",
                            "يجب أن تحتوي كلمة المرور على اكثر من 8 أحرف",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      } else {
                        Get.snackbar("حطأ", "أعد كتابة البيانات بشكل صحيح",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      }
                    },
                    child: Text(
                      "إنشاء حساب".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: kDarkBlueColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          "لدي حساب حالي",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
EmailField02(
                title: Text("Name"),
                titleStyle: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.w500,
                ),
                leading: Icon(
                  Icons.person_outline,
                  color: darkColor,
                  weight: 20,
                ),
                backgroundColor: lightColor,
              ),
              SizedBox(
                height: 20,
              ),
              EmailField02(
                title: Text("Email Address"),
                titleStyle: TextStyle(
                  color: Color(0xFF6e64e1),
                  fontWeight: FontWeight.w500,
                ),
                leading: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF6e64e1),
                ),
                backgroundColor: lightColor,
              ),
              SizedBox(
                height: 20,
              ),
              EmailField02(
                title: Text("Password"),
                titleStyle: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.w500,
                ),
                leading: Icon(
                  Icons.lock_outline,
                  color: darkColor,
                  weight: 20,
                ),
                backgroundColor: lightColor,
              ),





*/
