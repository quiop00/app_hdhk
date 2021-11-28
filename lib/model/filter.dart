class Filter {
  late int id;
  late String title;
  late String type;
  Filter();
  factory Filter.fromJson(Map<String, dynamic> json) => Filter()
    ..id = json["id"] as int
    ..title = json["title"] as String
    ..type = json['type'] as String;
}
