import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClientBuilder {
  final client = Client();
  Dio dio = Dio();

  //private constructor
  ApiClientBuilder._internal();

  static final _instance = ApiClientBuilder._internal();

  factory ApiClientBuilder() => _instance;

  static Future<void> setupDio() async {
    final prefs = await SharedPreferences.getInstance();
    String url =
        await Future<String>.value(prefs.getString("base_url_key") ?? '');
    log(url, name: 'setupDio');

    var newDio = Dio(BaseOptions(
      baseUrl: url,
    ));

    newDio.options.contentType = Headers.jsonContentType;
    // newDio.interceptors.addAll({
    //   AuthorizationInterceptor(),
    //   PrettyDioLogger( requestHeader: true, requestBody:true, responseHeader: true),
    // });

    ApiClientBuilder().dio = newDio;
  }
}
