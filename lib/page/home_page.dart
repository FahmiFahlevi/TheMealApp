import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:themealdb_app/data/request.dart';
import 'package:themealdb_app/model/app/category_model.dart';
import 'package:themealdb_app/model/app/singleton_model.dart';
import 'package:themealdb_app/tool/helper.dart';
import 'package:dio/dio.dart' as dio;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Helper _helper;
  late Request _request;
  Future? _future;
  late SingletonModel _model;

  @override
  void initState() {
    super.initState();
    _helper = Helper();
    _request = Request();
    _future = _request.data.category();
    _model = SingletonModel.withContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          color: Colors.red[800],
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10),
              child: Row(
                children: [
                  const Text(
                    "The MealDB App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const SpinKitThreeBounce(
              color: Colors.black,
              size: 12,
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              dio.Response res = snapshot.data as dio.Response;
              _model.categories = List<Category>.from(
                  res.data["data"].map((x) => Category.fromJson(x)));
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return _listArea(text: "text");
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Popular Ingredients",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          itemCount: _model.categories?.length,
                          itemBuilder: (BuildContext context, int i) {
                            List<Category>? data;
                            _model.categories = data;
                            return Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: SizedBox(
                                width: 130,
                                height: 155,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(data![i].strCategoryThumb),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      // const SizedBox(height: 5),
                                      Text(
                                        data![i].strCategory,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Random Meals",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          _cardRandomMeals(text: "text"),
                          _cardRandomMeals(text: "text"),
                          _cardRandomMeals(text: "text"),
                          _cardRandomMeals(text: "text"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Random Ingredients",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 170,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            }
        }
        return Container();
      },
    );
  }

  Widget _listArea({required text}) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(kImgArea1),
            //   fit: BoxFit.cover,
            // ),
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }

  Widget _cardRandomMeals({
    required String text,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Card(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const SizedBox(
              width: 80,
              height: 120,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
