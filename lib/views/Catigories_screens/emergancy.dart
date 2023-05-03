import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/constant.dart';

import '../../Model/emergency_model.dart';
import '../../controller/emergency_controller.dart';

class EmergancyScreen extends StatefulWidget {
  EmergancyScreen({super.key});

  @override
  State<EmergancyScreen> createState() => _EmergancyScreenState();
}

class _EmergancyScreenState extends State<EmergancyScreen> {
  EmergencyController controller = Get.put(EmergencyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: controller.getDoctors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      color: Colors.white,
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "https://scontent.faly8-2.fna.fbcdn.net/v/t39.30808-6/294921244_3252266831686137_4740279616031972522_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=174925&_nc_ohc=SDqAVoIj6-0AX9KsC3Y&_nc_ht=scontent.faly8-2.fna&oh=00_AfAd93x9f8hihb2GfzHVq2J0TcBxr1JvzXuZeRPnR3VpkA&oe=642B19B6"),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data!.documents[index].doctorName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data!.documents[index].doctorDescription}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "الكشف بأسبقية الحضور للعيادة",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${snapshot.data!.documents[index].doctorAddress}",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Divider(),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.hourglass_bottom,
                                          color: Colors.lightBlue,
                                          size: 50,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "مدة الانتظار",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              "${snapshot.data!.documents[index].waitingTime} دقيقة",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //-------------
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.monetization_on,
                                              color: Colors.lightBlue,
                                              size: 50,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "سعر الكشف",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                                Text(
                                                  "${snapshot.data!.documents[index].doctorPrice} جنية",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "احجز اليوم (${snapshot.data!.documents[index].fromTime}م-${snapshot.data!.documents[index].toTime}م)",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        width: double.infinity,
                      ),
                    );
                  },
                  itemCount: snapshot.data!.documents.length,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
