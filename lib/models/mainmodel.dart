import 'package:food_receipe/models/results.dart';

class MainModel {
  late List<Results> results;
  late int offset;
  late int number;
  late int totalresults;

  MainModel({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalresults,
  });

  MainModel.fromjson(Map<String, dynamic> map) {
    this.results = [];
    (map["results"]).forEach((element) {
      this.results.add(Results.fromjson(element));
    });
    this.offset = map["offset"];
    this.number = map["number"];
    this.totalresults = map["totalResults"];
  }

  Map<String, dynamic> tomap() {
    List<Map> list2 = [];
    this.results.forEach((element) {
      list2.add(element.tomap());
    });
    Map<String, dynamic> map = {
      "results": list2,
      "offset": this.offset,
      "number": this.number,
      "totalresults": this.totalresults,
    };
    return map;
  }
}
