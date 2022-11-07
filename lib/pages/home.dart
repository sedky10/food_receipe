
import 'receipes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
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
          'Recipe',
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
      body: const Screen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff079681),
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        currentIndex: currentindex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() {
          currentindex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outlined,
            ),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
