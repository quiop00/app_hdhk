// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://45.77.253.226/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<EventResponse> getEvents(params) async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response = await dio.get('http://45.77.253.226/api/event',
        queryParameters: params);
    if (response.statusCode == 200) {
      return EventResponse.fromJson(response.data['data']);
    } else {
      throw Exception('');
    }
  }

  @override
  Future<EventResponse> getRelatedEvent(idEvent) async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response = await dio
        .get('http://45.77.253.226/api/event/$idEvent/get-list-related');
    if (response.statusCode == 200) {
      return EventResponse.fromJson(response.data['data']);
    } else {
      throw Exception('');
    }
  }

  @override
  Future<ExhibitionResponse> getExhibition(params) async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response = await dio.get('http://45.77.253.226/api/exhibition',
        queryParameters: params);
    if (response.statusCode == 200) {
      return ExhibitionResponse.fromJson(response.data['data']);
    } else {
      throw Exception('');
    }
  }

  @override
  Future<List<String>> getGalleriesByType(type) async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response = await dio.get('http://45.77.253.226/api/galleries',
        queryParameters: {'group_type': type});
    if (response.statusCode == 200) {
      List<String> images = [];
      (response.data[0]['data']).forEach((element) {
        images.add(element);
      });
      return images;
    } else {
      throw Exception('');
    }
  }

  @override
  Future<List<SliderEvent>> getPagodas() async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response =
        await dio.get('http://45.77.253.226/api/event/get-list-pagoda');
    if (response.statusCode == 200) {
      List data = response.data['data'];
      var lstPagoda = <SliderEvent>[];
      data.forEach((element) {
        lstPagoda.add(SliderEvent.fromJson((element as Map<String, dynamic>)));
      });
      return lstPagoda;
    } else {
      throw Exception('');
    }
  }

  @override
  Future<List<Filter>> getFilterEvent() async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response =
        await dio.get('http://45.77.253.226/api/event/get-list-category');
    if (response.statusCode == 200) {
      List data = response.data['data'];
      var lstCategory = <Filter>[];
      data.forEach((element) {
        lstCategory.add(Filter.fromJson((element as Map<String, dynamic>)));
      });
      return lstCategory;
    } else {
      throw Exception('');
    }
  }

  @override
  Future<List<Author>> getExhibitionAuthor() async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response =
        await dio.get('http://45.77.253.226/api/exhibition/get-list-author');
    if (response.statusCode == 200) {
      List data = response.data['data'];
      var lstCategory = <Author>[];
      data.forEach((element) {
        lstCategory.add(Author.fromJson((element as Map<String, dynamic>)));
      });
      return lstCategory;
    } else {
      throw Exception('');
    }
  }

  @override
  Future<ExhibitionResponse> getRelatedExhibition(idExhibition) async {
    var dio = Dio();
    dio.options.headers['Accept'] = 'application/json';
    final response = await dio.get(
        'http://45.77.253.226/api/exhibition/$idExhibition/get-list-related');
    if (response.statusCode == 200) {
      return ExhibitionResponse.fromJson(response.data['data']);
    } else {
      throw Exception('');
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
