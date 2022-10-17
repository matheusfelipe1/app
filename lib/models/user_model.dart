import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? id;
  String? email;
  String? passowrd;
  String? name;

  UserModel({this.email, this.id, this.name, this.passowrd});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }

  toJson() {
    Map data = {};
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
