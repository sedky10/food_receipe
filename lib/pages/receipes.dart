import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_receipe/api/apirepo.dart';
import 'package:food_receipe/models/mainmodel.dart';
import 'package:food_receipe/pages/product.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late MainModel object;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MainModel>(
      future: Api().getApiData(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          object = snapshot.data!;
          print(snapshot.data!.tomap().toString());
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 25,
              ),
              itemCount: object.results.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Meal(
                          dataa: object.results.elementAt(index),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          object.results.elementAt(index).image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        object.results.elementAt(index).title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
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
    );
  }
}