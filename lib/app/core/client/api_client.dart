import 'package:dio/dio.dart';

class ApiClient {
  static Dio get client {
    final dio = Dio();
    dio.options.baseUrl = 'https://api.escuelajs.co';
    return dio;
  }
}
