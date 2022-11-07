import 'dart:convert';

import 'package:food_receipe/models/mainmodel.dart';
import 'package:http/http.dart' as http;
class Api {
  Future<MainModel> getApiData() async {
    final http.Response request = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=a4b492ee3f734512b279e11e4f8f9fe7"));
    if (request.statusCode >= 200 && request.statusCode <= 299) {
      final Map<String, dynamic> jsonbody = jsonDecode(request.body);
      MainModel response = MainModel.fromjson(jsonbody);
      return response;
    } else {
      throw ('failure' + request.body);
    }
  }
}