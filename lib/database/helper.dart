import 'database.dart';

class Helper {
  int? id;
  late String name;

  late String url;

  Helper({
    this.id,
    required this.name,
    required this.url,
  });

  Helper.fromMap(Map<String, dynamic> map) {
    if (map[ColumnId] != null) {
      this.id = map[ColumnId];
    }
    this.name = map[ColumnName];

    this.url = map[ColumnUrl];
  }

  Map<String, dynamic> tomap() {
    Map<String, dynamic> map = {};
    if (this.id != null) {
      map[ColumnId] = this.id;
    }
    map[ColumnName] = this.name;

    map[ColumnUrl] = this.url;
    return map;
  }
}
