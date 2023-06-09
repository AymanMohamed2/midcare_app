import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/constant.dart';
import 'package:medicare_app/views/login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "اعدادات الصفحة الشخصية",
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    "اعدادات عامة",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListTile(
                leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: grey,
                    padding: EdgeInsets.all(
                      5,
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.creditcard,
                    color: darkColor,
                  ),
                ),
                title: Text(
                  "الدفع & الاشتراكات",
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListTile(
                leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: grey,
                  ),
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.person,
                    color: darkColor,
                  ),
                ),
                title: Text(
                  "اعدادات الحساب",
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListTile(
                leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: grey,
                  ),
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.lock,
                    color: darkColor,
                  ),
                ),
                title: Text(
                  "تحديث كلمة المرور",
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListTile(
                leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: grey,
                  ),
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.bell,
                    color: darkColor,
                  ),
                ),
                title: Text(
                  "الاشعارات",
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListTile(
                onTap: () {
                  Get.to(
                    Login(),
                  );
                },
                leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: grey,
                  ),
                  onPressed: () {
                    Get.to(
                      Login(),
                    );
                  },
                  child: Icon(
                    Icons.logout,
                    color: darkColor,
                  ),
                ),
                title: Text(
                  "تسجيل الخروج",
                ),
                trailing: Icon(
                  CupertinoIcons.right_chevron,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
