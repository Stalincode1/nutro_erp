import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? phoneNo;
  String? email;
  String? isAdmin;
  String? gender;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNo,
    required this.email,
    required this.isAdmin,
    required this.gender,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? phoneNo,
    String? email,
    String? isAdmin,
    String? gender,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNo: phoneNo ?? this.phoneNo,
        email: email ?? this.email,
        isAdmin: isAdmin ?? this.isAdmin,
        gender: gender ?? this.gender,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phoneNo: json["phoneNo"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phoneNo": phoneNo,
        "email": email,
        "isAdmin": isAdmin,
        "gender": gender,
      };

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
