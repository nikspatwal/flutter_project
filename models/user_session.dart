// To parse this JSON data, do
//
//     final userSession = userSessionFromJson(jsonString);

import 'dart:convert';

UserSession userSessionFromJson(String str) => UserSession.fromJson(json.decode(str));

String userSessionToJson(UserSession data) => json.encode(data.toJson());

class UserSession {
  List<ChildEntityDetail> childEntityDetails;
  String userId;
  String username;
  String firstName;
  String lastName;
  String middleName;
  String entityId;
  String entityName;
  String entityImageHash;
  String entityLogoHash;
  bool changePassword;
  bool loginForWork;
  ThemeDetails themeDetails;
  List<String> role;

  UserSession({
    this.childEntityDetails,
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.middleName,
    this.entityId,
    this.entityName,
    this.entityImageHash,
    this.entityLogoHash,
    this.changePassword,
    this.loginForWork,
    this.themeDetails,
    this.role,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) => UserSession(
    childEntityDetails: List<ChildEntityDetail>.from(json["child_entity_details"].map((x) => ChildEntityDetail.fromJson(x))),
    userId: json["user_id"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    middleName: json["middle_name"],
    entityId: json["entity_id"],
    entityName: json["entity_name"],
    entityImageHash: json["entity_image_hash"],
    entityLogoHash: json["entity_logo_hash"],
    changePassword: json["change_password"],
    loginForWork: json["login_for_work"],
    themeDetails: ThemeDetails.fromJson(json["theme_details"]),
    role: List<String>.from(json["role"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "child_entity_details": List<dynamic>.from(childEntityDetails.map((x) => x.toJson())),
    "user_id": userId,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "middle_name": middleName,
    "entity_id": entityId,
    "entity_name": entityName,
    "entity_image_hash": entityImageHash,
    "entity_logo_hash": entityLogoHash,
    "change_password": changePassword,
    "login_for_work": loginForWork,
    "theme_details": themeDetails.toJson(),
    "role": List<dynamic>.from(role.map((x) => x)),
  };
}

class ChildEntityDetail {
  String entityId;
  String entityName;
  String address;
  String city;
  String pincode;

  ChildEntityDetail({
    this.entityId,
    this.entityName,
    this.address,
    this.city,
    this.pincode,
  });

  factory ChildEntityDetail.fromJson(Map<String, dynamic> json) => ChildEntityDetail(
    entityId: json["entity_id"],
    entityName: json["entity_name"],
    address: json["address"],
    city: json["city"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "entity_id": entityId,
    "entity_name": entityName,
    "address": address,
    "city": city,
    "pincode": pincode,
  };
}

class ThemeDetails {
  String themeColor;
  String textColor;

  ThemeDetails({
    this.themeColor,
    this.textColor,
  });

  factory ThemeDetails.fromJson(Map<String, dynamic> json) => ThemeDetails(
    themeColor: json["theme_color"],
    textColor: json["text_color"],
  );

  Map<String, dynamic> toJson() => {
    "theme_color": themeColor,
    "text_color": textColor,
  };
}
