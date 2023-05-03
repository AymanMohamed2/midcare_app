// To parse this JSON data, do
//
//     final emergencyModel = emergencyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EmergencyModel emergencyModelFromJson(String str) =>
    EmergencyModel.fromJson(json.decode(str));

String emergencyModelToJson(EmergencyModel data) => json.encode(data.toJson());

class EmergencyModel {
  EmergencyModel({
    required this.total,
    required this.documents,
  });

  final int total;
  final List<Document> documents;

  factory EmergencyModel.fromJson(Map<String, dynamic> json) => EmergencyModel(
        total: json["total"],
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  Document({
    required this.doctorName,
    required this.doctorDescription,
    required this.doctorAddress,
    required this.waitingTime,
    required this.doctorPrice,
    required this.fromTime,
    required this.toTime,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
    required this.collectionId,
    required this.databaseId,
  });

  final String doctorName;
  final String doctorDescription;
  final String doctorAddress;
  final int waitingTime;
  final int doctorPrice;
  final String fromTime;
  final String toTime;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> permissions;
  final String collectionId;
  final String databaseId;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        doctorName: json["doctor_name"],
        doctorDescription: json["doctor_description"],
        doctorAddress: json["doctor_address"],
        waitingTime: json["waiting_time"],
        doctorPrice: json["doctor_price"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        id: json["\u0024id"],
        createdAt: DateTime.parse(json["\u0024createdAt"]),
        updatedAt: DateTime.parse(json["\u0024updatedAt"]),
        permissions:
            List<dynamic>.from(json["\u0024permissions"].map((x) => x)),
        collectionId: json["\u0024collectionId"],
        databaseId: json["\u0024databaseId"],
      );

  Map<String, dynamic> toJson() => {
        "doctor_name": doctorName,
        "doctor_description": doctorDescription,
        "doctor_address": doctorAddress,
        "waiting_time": waitingTime,
        "doctor_price": doctorPrice,
        "from_time": fromTime,
        "to_time": toTime,
        "\u0024id": id,
        "\u0024createdAt": createdAt.toIso8601String(),
        "\u0024updatedAt": updatedAt.toIso8601String(),
        "\u0024permissions": List<dynamic>.from(permissions.map((x) => x)),
        "\u0024collectionId": collectionId,
        "\u0024databaseId": databaseId,
      };
}
