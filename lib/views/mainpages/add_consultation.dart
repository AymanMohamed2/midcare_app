import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/widgets/emailfield01.dart';
import '../../constant.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AddConsultation extends StatelessWidget {
  AddConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "أرسل استشارة",
          style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "نوع الاستشارة",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkColor),
              ),
              DropdownSearch<String>(
                items: ["عادية", "مستعجلة"],
                autoValidateMode: AutovalidateMode.always,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.justify,
                  baseStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                selectedItem: 'عادية',
              ),
              //----------------------------
              Text(
                "التخصص",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              DropdownSearch<String>(
                items: [
                  "الأطفال وحديثي الولادة",
                  "الاسعاف والطوارئ",
                  "تخصص الجراحة",
                  "تخصص الأنف والأذن",
                  "تخصص الأسنان",
                  "تخصص الباطنة",
                  "تخصص الأشعة",
                  "تخصص المخ والأعصاب",
                  "تخصص الجلدية",
                  "تخصص النساء والتوليد"
                ],
                autoValidateMode: AutovalidateMode.always,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.justify,
                  baseStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                selectedItem: "تخصص الجلدية",
              ),
              //----------------------
              Text(
                "اسم المستشفى",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              DropdownSearch<String>(
                items: [
                  'مستشفى عين شمس التخصصي',
                  "مستشفى جامعة الأزهر",
                  "مستشفى الزهراء"
                ],
                autoValidateMode: AutovalidateMode.always,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.justify,
                  baseStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                selectedItem: 'مستشفى عين شمس التخصصي',
              ),
              //----------------------
              Text(
                "السن",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              EmailField01(
                leading: Icon(Icons.man),
                title: Text("اكتب عمرك: بوحدة ال سم"),
                keyboradType: TextInputType.phone,
              ),
              Text(
                "الوزن",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              EmailField01(
                leading: Icon(Icons.monitor_weight),
                title: Text("اكتب وزنك: بوجدة الكيلوجرام"),
                keyboradType: TextInputType.phone,
              ),
              Text(
                "هل تعاني من اي أمراض ؟",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              DropdownSearch<String>(
                items: ["نعم", "لا"],
                autoValidateMode: AutovalidateMode.always,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.justify,
                  baseStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                selectedItem: "لا",
              ),
              Text(
                "قم بوصف حالتك بدقة",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              TextFormField(
                maxLength: 500,
                maxLines: 6,
                minLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), fillColor: darkColor),
              ),
              Text(
                "قم بإضافة صور التحاليل أو الاشعة",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              TextButton(
                onPressed: () {},
                child: Text("ارفق ملف"),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(2),
                  backgroundColor: MaterialStateProperty.all(lightColor),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 18, fontFamily: "Cairo")),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "ارسال الاستشارة",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
