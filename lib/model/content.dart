class Content {
  late int id;
  late String content;
  late String author;
  Content();
  factory Content.fromJson(Map<String, dynamic> json) => Content()
    ..id = json['id'] as int
    ..author = json['author'] as String
    ..content = json['content'] as String;
}
