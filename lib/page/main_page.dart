import 'package:flutter/material.dart';
import 'package:themealdb_app/model/post_result_model.dart';
import 'package:themealdb_app/model/user_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PostResult? postResult;
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API DEMO"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            (user != null)
                ? "${user!.id} | ${user!.email} | ${user!.name} | ${user!.avatar}"
                : "Tidak Ada Data",
            style: const TextStyle(fontSize: 16),
          ),
          MaterialButton(
            onPressed: () {
              UserModel.connectToAPI("2").then((value) {
                user = value;
                setState(() {});
              });
            },
            color: Colors.grey,
            child: const Text(
              "GET",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
