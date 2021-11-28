import 'package:app_chua/model/exhibition/exhibition.dart';

class ExhibitionResponse {
  late int current_page;
  late List<Exhibition> data;

  ExhibitionResponse();

  factory ExhibitionResponse.fromJson(Map<String, dynamic> json) =>
      ExhibitionResponse()
        ..current_page = json['current_page'] as int
        ..data = (json['data'] as List<dynamic>)
            .map((e) => Exhibition.fromJson(e as Map<String, dynamic>))
            .toList();
}
