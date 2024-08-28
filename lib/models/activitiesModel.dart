// To parse this JSON data, do
//
//     final activitiesForYou = activitiesForYouFromJson(jsonString);

import 'dart:convert';

ActivitiesForYou activitiesForYouFromJson(String str) =>
    ActivitiesForYou.fromJson(json.decode(str));

String activitiesForYouToJson(ActivitiesForYou data) =>
    json.encode(data.toJson());

class ActivitiesForYou {
  bool status;
  String message;
  String messageIos;
  List<Datum> data;

  ActivitiesForYou({
    required this.status,
    required this.message,
    required this.messageIos,
    required this.data,
  });

  factory ActivitiesForYou.fromJson(Map<String, dynamic> json) =>
      ActivitiesForYou(
        status: json["status"],
        message: json["message"],
        messageIos: json["message_ios"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ios": messageIos,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String icon;

  Datum({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}
