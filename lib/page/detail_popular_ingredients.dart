import 'package:flutter/material.dart';

class DetailPopularIngredients extends StatefulWidget {
  const DetailPopularIngredients({Key? key}) : super(key: key);

  @override
  State<DetailPopularIngredients> createState() =>
      _DetailPopularIngredientsState();
}

class _DetailPopularIngredientsState extends State<DetailPopularIngredients> {
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
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border,
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
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(kImgDetail),
                  //   fit: BoxFit.fill,
                  // ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Mustard champ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                        const SizedBox(width: 5),
                        _listIngredients(text: "Text"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Instructions",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                "STEP 1 Boil the potatoes for 15 mins or until tender.Drain, then mash.STEP 2 Heat the milk and half the butter in the corner of the pan, then beat into the mash, along with the wholegrain mustard.STEP 3 Gently fry the spring onions in the remaining butter for 2 mins until just soft but still a perky green.Fold into the mash and serve.Great with gammon or to top a fish pie.",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _listIngredients({required text}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
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
}
