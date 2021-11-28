import 'dart:convert';

import 'package:app_chua/model/author/author.dart';
import 'package:app_chua/model/event/slider_event.dart';
import 'package:app_chua/model/filter.dart';
import 'package:app_chua/network/response/event_response.dart';
import 'package:app_chua/network/response/base_response.dart';
import 'package:app_chua/network/response/exhibition_response.dart';
import 'package:app_chua/services/local_storage.dart';
import 'package:app_chua/ui/pages/event/widgets/event_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app_chua/env.dart' as env;
part 'api.g.dart';

@RestApi(baseUrl: "http://45.77.253.226/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET('event')
  Future<EventResponse> getEvents(params);
  @GET('event/get-list-pagoda')
  Future<List<SliderEvent>> getPagodas();
  @GET('event/get-list-category')
  Future<List<Filter>> getFilterEvent();
  @GET('event/get-list-related')
  Future<EventResponse> getRelatedEvent(idEvent);
  @GET('galleries')
  Future<List<String>> getGalleriesByType(type);
  @GET('exhibition')
  Future<ExhibitionResponse> getExhibition(params);
  @GET('exhibition')
  Future<List<Author>> getExhibitionAuthor();
  @GET('exhibition/get-list-related')
  Future<ExhibitionResponse> getRelatedExhibition(idExhibition);
}

class Api {
  ApiClient? client;
  Api() {
    final Dio dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 30000;
    dio.options.baseUrl = env.BASE_API_URL;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, _) {
        final token = PreferenceUtils.getString('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        } else
          options.headers['Authorization'] = 'Bearer';
        //return options;
      },
    ));
    client = ApiClient(dio, baseUrl: env.BASE_API_URL);
  }
}
