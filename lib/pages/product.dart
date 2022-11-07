import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_receipe/api/api2repo.dart';
import 'package:food_receipe/database/database.dart';
import 'package:food_receipe/database/helper.dart';
import 'package:food_receipe/models/favmode.dart';
import 'package:food_receipe/models/results.dart';

class Meal extends StatefulWidget {
  const Meal({Key? key, required this.dataa}) : super(key: key);
  final Results dataa;

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  late FavouriteModel response;
  late int id;
  bool fav = false;

  @override
  void initState() {
    super.initState();
    id = widget.dataa.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.white),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff079681),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                fav = !fav;
                if (fav = false) {
                  Back.instance.deleteTodo(id);
                } else {
                  Back.instance.insertTodo(
                    Helper(name: response.title, url: response.image, id: id),
                  );
                }
              });
            },
            icon: fav
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  ),
          ),
          const Icon(
            Icons.slow_motion_video_sharp,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.share,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: FutureBuilder<FavouriteModel>(
        future: ApiRepo2().getApiData(id),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            response = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  response.image,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    response.title,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color(0xff079681),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Easy',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Color(0xff079681),
                        ),
                        Text(
                          '${response.readyInMinutes.toString()} min',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    response.summary,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${response.servings} Serving',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                response.servings++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                response.servings--;
                                if (response.servings < 1) {
                                  response.servings = 1;
                                }
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          return Center(
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
