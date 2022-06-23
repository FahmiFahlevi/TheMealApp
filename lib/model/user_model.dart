import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class UserModel {
  late String id;
  late String email;
  late String name;
  late String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory UserModel.createUser(Map<String, dynamic> object) {
    return UserModel(
      id: object['id'].toString(),
      email: object['email'],
      name: object['first_name'] + " " + object['last_name'],
      avatar: object['avatar'],
    );
  }

  static Future<UserModel> connectToAPI(String id) async {
    var apiResult = await http.get(Uri.parse("https://reqres.in/api/users$id"));
    var jsonObject = jsonDecode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return UserModel.createUser(userData);
  }
}
