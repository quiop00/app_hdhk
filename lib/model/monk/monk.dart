class Monk {
  int? id;
  String? name;
  String? image;
  List<String>? filters;
  Monk();
  factory Monk.fromJson(Map<String, dynamic> json) => Monk()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..image = json['image'] as String
    ..filters = (json["filters"] as List<String>?)?.map((e) => e).toList();
}
