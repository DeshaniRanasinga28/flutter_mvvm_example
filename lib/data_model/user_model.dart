import 'dart:convert';

UserDataModel userModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  String status;
  List<UserDetails> data;

  UserDataModel({
    required this.status,
    required this.data,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        status: json["status"],
        data: List<UserDetails>.from(
            json["data"].map((x) => UserDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserDetails {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserDetails({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
