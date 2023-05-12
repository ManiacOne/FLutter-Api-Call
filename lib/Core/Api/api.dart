import 'package:dio/dio.dart';

class Api{
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String baseURLpath = "/users";

  final dio=Dio(BaseOptions(
    baseUrl: Api.baseUrl,
  ));

  Future<dynamic> get(String uri)async{
    Response response = await dio.get(uri);
    return response.data;
  }
}