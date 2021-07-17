// To parse this JSON data, do
//
//     final dashboardDetails = dashboardDetailsFromJson(jsonString);

import 'dart:convert';

DashboardDetails dashboardDetailsFromJson(String str) =>
    DashboardDetails.fromJson(json.decode(str));

String dashboardDetailsToJson(DashboardDetails data) =>
    json.encode(data.toJson());

class DashboardDetails {
  DashboardDetails({
    this.status,
    this.message,
    this.payload,
  });

  bool status;
  String message;
  Map<String, int> payload;

  factory DashboardDetails.fromJson(Map<String, dynamic> json) =>
      DashboardDetails(
        status: json["status"],
        message: json["message"],
        payload: Map.from(json["payload"])
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "payload":
            Map.from(payload).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
