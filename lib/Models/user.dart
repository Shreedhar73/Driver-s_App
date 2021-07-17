// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.status,
    this.message,
    this.payload,
  });

  bool status;
  String message;
  Payload payload;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        payload: Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "payload": payload.toJson(),
      };
}

class Payload {
  Payload({
    this.userDetails,
    this.allPermissions,
  });

  UserDetails userDetails;
  List<String> allPermissions;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        userDetails: UserDetails.fromJson(json["userDetails"]),
        allPermissions: List<String>.from(json["allPermissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userDetails": userDetails.toJson(),
        "allPermissions": List<dynamic>.from(allPermissions.map((x) => x)),
      };
}

class UserDetails {
  UserDetails({
    this.id,
    this.guardName,
    this.fullName,
    this.username,
    this.email,
    this.role,
    this.activeStatus,
    this.address,
    this.phoneNumber,
    this.isSuperAdmin,
    this.citizenshipNo,
    this.citizenshipDigital,
    this.licenseNumber,
    this.licenseDigital,
    this.billbookNumber,
    this.billbookDigital,
    this.permissions,
  });

  int id;
  String guardName;
  String fullName;
  String username;
  String email;
  String role;
  int activeStatus;
  String address;
  String phoneNumber;
  int isSuperAdmin;
  String citizenshipNo;
  String citizenshipDigital;
  String licenseNumber;
  String licenseDigital;
  String billbookNumber;
  String billbookDigital;
  List<String> permissions;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        guardName: json["guard_name"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        role: json["role"],
        activeStatus: json["active_status"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        isSuperAdmin: json["is_super_admin"],
        citizenshipNo: json["citizenship_no"],
        citizenshipDigital: json["citizenship_digital"],
        licenseNumber: json["license_number"],
        licenseDigital: json["license_digital"],
        billbookNumber: json["billbook_number"],
        billbookDigital: json["billbook_digital"],
        permissions: List<String>.from(json["permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guard_name": guardName,
        "full_name": fullName,
        "username": username,
        "email": email,
        "role": role,
        "active_status": activeStatus,
        "address": address,
        "phone_number": phoneNumber,
        "is_super_admin": isSuperAdmin,
        "citizenship_no": citizenshipNo,
        "citizenship_digital": citizenshipDigital,
        "license_number": licenseNumber,
        "license_digital": licenseDigital,
        "billbook_number": billbookNumber,
        "billbook_digital": billbookDigital,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
      };
}
