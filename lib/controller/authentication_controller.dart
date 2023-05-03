import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/views/home_patient_screen.dart';
import 'package:medicare_app/widgets/doctor_sign_up_account.dart';

import '../constant.dart';
import '../widgets/patient_sign_up_account.dart';
import 'package:appwrite/appwrite.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String? currentUserName;
  Future<void> createPatientAccount(String email, String name, String password,
      String phone, String gander) async {
    String url = "https://cloud.appwrite.io/v1/users";
    var headers = {
      "Content-Type": "application/json",
      "X-Appwrite-Project": "6425a0c72e7d63bb50c8",
      "X-Appwrite-Key":
          "12955eac217643e9f043f8286521c5fc6939aaab26a2b69633cc4266d8201cb32b9bd6571541b0929962fa330abab2e7f88035aa27abc3599719857a21ef2f7e172c34c2d8ec5b9c2dd90e43ff3353bcafb16c654d7a320fc17f7de1ee97a3a87ed26891e2f2bac8897efeb197a1dd598b989378435f29f9b4700ba1d1658d16",
    };
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('6425a0c72e7d63bb50c8'); // Your project ID

    final account = Account(client);

    var body = {
      "userId": ID.unique(),
      "email": "$email",
      "phone": "+2$phone",
      "password": "$password",
      "name": "$name"
    };
    var informations = jsonEncode(body);
    http.Response response =
        await http.post(Uri.parse(url), body: informations, headers: headers);
    
    if (response.statusCode == 201) {
      var result = jsonDecode(response.body);
      var userId = result["\$id"];
      dynamic accountInformations = await account.get();
      currentUserName = accountInformations.name;
      await UpdatePatientPref(userId, gander);
    } else {
      print("noo");
    }
    update();
  }

  Future<void> UpdatePatientPref(userId, String gander) async {
    String url = "https://cloud.appwrite.io/v1/users/$userId/prefs";

    var headers = {
      "Content-Type": "application/json",
      "X-Appwrite-Project": "6425a0c72e7d63bb50c8",
      "X-Appwrite-Key":
          "12955eac217643e9f043f8286521c5fc6939aaab26a2b69633cc4266d8201cb32b9bd6571541b0929962fa330abab2e7f88035aa27abc3599719857a21ef2f7e172c34c2d8ec5b9c2dd90e43ff3353bcafb16c654d7a320fc17f7de1ee97a3a87ed26891e2f2bac8897efeb197a1dd598b989378435f29f9b4700ba1d1658d16",
    };
    var body = {
      "prefs": {"النوع": "$gander"}
    };
    var informations = jsonEncode(body);

    http.Response response =
        await http.patch(Uri.parse(url), body: informations, headers: headers);
    update();
  }

  Future<void> patientLogin(String email, String password) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('6425a0c72e7d63bb50c8'); // Your project ID

    final account = Account(client);

    final session = await account.createEmailSession(
        email: '$email', password: '$password');
    dynamic accountInformations = await account.get();

    if (session.current) {
      Get.offAll(HomePatientScreen());
      Get.snackbar("نجح", "تم تسجيل الدخول بنجاح",
          backgroundColor: Colors.green, colorText: Colors.white);
      currentUserName = accountInformations.name;
    } else {
      Get.snackbar("حطأ", "أعد كتابة البيانات بشكل صحيح",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    update();
  }
  //---------------
}
