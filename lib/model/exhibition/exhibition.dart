import 'package:intl/intl.dart';

class Exhibition {
  late int id;
  late String title;
  late String content;
  late String type;
  late String image;
  late String createdAt;
  bool? isBookmark;
  Exhibition();
  factory Exhibition.fromJson(Map<String, dynamic> json) => Exhibition()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..type = json['type'] as String
    ..createdAt = json['created_at'] as String
    ..isBookmark =
        (json['isBookmark'] == null ? false : (json['isBookmark'] as bool))
    ..image = json['image'] as String;
  getDate() {
    final dateTime = DateTime.parse(this.createdAt);
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime);
  }
}
