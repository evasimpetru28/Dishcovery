
import 'package:dio/dio.dart';
import 'package:dishcovery/data/network/api_builder.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {

  // Future<Response<Object>> connectToDomain(String url){
  //   return Dio(BaseOptions(baseUrl: url)).get('/check');
  // }

  Future<Response<Map<String, dynamic>>> getRecipes() async {
    return await ApiClientBuilder().dio.get('recipes');
  }
}