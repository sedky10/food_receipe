import 'dart:convert';

import 'package:food_receipe/models/favmode.dart';

import 'package:http/http.dart' as http;

class ApiRepo2 {
  Future<FavouriteModel> getApiData(int id) async {
    final http.Response request = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/$id/information?apiKey=a4b492ee3f734512b279e11e4f8f9fe7"));
    if (request.statusCode >= 200 && request.statusCode <= 299) {
      final Map<String, dynamic> jsonbody = jsonDecode(request.body);
      FavouriteModel response = FavouriteModel.fromjson(jsonbody);
      ;
      return response;
    } else {
      throw ('failure' + request.body);
    }
  }
}
