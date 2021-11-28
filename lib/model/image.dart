class ImageModel {
  late String url;
  String? alt;
  ImageModel();
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel()
    ..url = json['url'] as String
    ..alt = json['alt'] != null ? json['alt'] as String : null;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'url': this.url, 'alt': this.alt};
}
