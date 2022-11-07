class FavouriteModel {
  late String title;
  late int readyInMinutes;
  late int servings;
  late String image;
  late String imageType;
  late String summary;

  FavouriteModel({
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.image,
    required this.imageType,
    required this.summary,
  });

  FavouriteModel.fromjson(Map<String, dynamic> map) {
    this.title = map["title"];
    this.readyInMinutes = map["readyInMinutes"];
    this.servings = map["servings"];
    this.image = map["image"];
    this.imageType = map["imageType"];
    this.summary = map["summary"];
  }

  Map<String, dynamic> tojson() {
    Map<String, dynamic> map = {
      "title": this.title,
      "readyInMinutes": this.readyInMinutes,
      "servings": this.servings,
      "image": this.image,
      "imageType": this.imageType,
      "summary": this.summary,
    };
    return map;
  }
}
