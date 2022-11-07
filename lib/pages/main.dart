import 'package:flutter/material.dart';
import 'package:food_receipe/database/database.dart';


import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Back.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}
