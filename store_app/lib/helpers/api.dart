import 'dart:ffi';

import 'package:dio/dio.dart';

class Api {
  final dio = Dio();
  Future<Response> get(String url) async {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({required String url, required dynamic data}) async {
    final dio = Dio();

    Response response = await dio.post(url, data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Problem with status code ${response.statusCode}");
    }
  }

  Future<dynamic> put({required String url, required dynamic data}) async {
    final dio = Dio();
    print('url $url');
    print('data $data');
    Response response = await dio.put(url, data: data);
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception("Problem with status code ${response.statusCode}");
    }
  }
}
