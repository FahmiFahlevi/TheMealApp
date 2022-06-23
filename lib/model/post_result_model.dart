import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class PostResult {
  late String id;
  late String name;
  late String job;
  late String created;

  PostResult(
      {required this.id,
      required this.name,
      required this.job,
      required this.created});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<PostResult> connectToAPI(String name, String job) async {
    var apiResult = await http.post(
      Uri.parse("https://reqres.in/api/users"),
      body: {"name": name, "job": job},
    );
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
