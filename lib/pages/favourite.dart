import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_receipe/database/database.dart';
import 'package:food_receipe/database/helper.dart';


class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Helper> receipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0xff079681),
            size: 30,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Favourite Recipe',
          style: TextStyle(
            color: Color(0xff079681),
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color(0xff079681),
              size: 30,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Helper>>(
        future: Back.instance.getAllTodo(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            receipes = snapshot.data!;
            return  Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: GridView.builder(
                physics:const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 25,
                ),
                itemCount:receipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          receipes.elementAt(index).url,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                      receipes.elementAt(index).name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                },
              ),
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
