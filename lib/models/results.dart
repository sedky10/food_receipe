class Results {
  late int id;
  late String title;
  late String image;
  late String imagetype;

  Results({
    required this.id,
    required this.title,
    required this.image,
    required this.imagetype,
  });

  Results.fromjson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.image = map["image"];
    this.imagetype = map["imageType"];
  }

  Map<String, dynamic> tomap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "title": this.title,
      "image": this.image,
      "imageType": this.imagetype,
    };
    return map;
  }
}
