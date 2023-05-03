import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/constant.dart';
import 'package:medicare_app/controller/authentication_controller.dart';
import 'package:medicare_app/views/forgotPassword.dart';
import 'package:medicare_app/views/home.dart';
import 'package:medicare_app/views/home_patient_screen.dart';
import 'package:medicare_app/views/mainpages/profile.dart';
import 'package:medicare_app/views/register.dart';
import 'package:medicare_app/widgets/emailfield01.dart';
import 'package:medicare_app/widgets/emailfield02.dart';

class Login extends StatelessWidget {
  TextEditingController logEmailPatientController = TextEditingController();
  TextEditingController logPasswordPatientController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "تسجيل حسابك الحالي",
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
                Image.asset("assets/images/loginlogo.png"),
                EmailField02(
                  title: Text("البريد الالكتروني"),
                  titleStyle: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: logEmailPatientController,
                  leading: Icon(
                    Icons.email_outlined,
                    color: kDarkBlueColor,
                  ),
                  backgroundColor: lightColor,
                ),
                SizedBox(
                  height: 20,
                ),
                EmailField02(
                  title: Text("كلمةالمرور"),
                  titleStyle: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w500,
                  ),
                  leading: Icon(
                    Icons.lock_outline,
                    color: kDarkBlueColor,
                    weight: 20,
                  ),
                  controller: logPasswordPatientController,
                  backgroundColor: lightColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: kDarkBlueColor,
                        ),
                        onPressed: () {
                          Get.to(
                            ForgotPassword(),
                          );
                        },
                        child: Text(
                          "هل نسيت كلمة المرور ؟",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                      if (logEmailPatientController.text.trim().length == 0 ||
                          logPasswordPatientController.text.trim().length ==
                              0) {
                        Get.snackbar("خطأ", "أعد كتابة البيانات بشكل صحيح",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      } else {
                        controller.patientLogin(
                            logEmailPatientController.text.trim(),
                            logPasswordPatientController.text.trim());
                      }
                    },
                    child: Text(
                      "تسجيل الدخول".toUpperCase(),
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
                        onPressed: () {
                          Get.to(
                            Register(),
                          );
                        },
                        child: Text(
                          "لا أملك حساب حالي",
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
