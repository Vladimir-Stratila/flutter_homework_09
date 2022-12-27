import 'package:dio/dio.dart';


class DioClientFactory {

  Dio getClient() {
    final client = Dio();
    client.interceptors.add(LogInterceptor(
      responseHeader: false,
      responseBody: true,
    ));
    return client;
  }
}