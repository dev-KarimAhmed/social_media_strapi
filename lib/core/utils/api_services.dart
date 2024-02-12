import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'http://192.168.1.5:1337/api/';
  final Dio dio;

  ApiServices({required this.dio});

  Future<Response> register(String endPoint, Map<String, dynamic> data) async {
    try {
      final Response<dynamic> response = await dio.post(
        _baseUrl + endPoint,
        data: data,
      );

      // You might want to handle errors or status codes here if needed

      return response;
    } catch (e) {
      // Handle exceptions or errors here, if necessary
      rethrow;
    }
  }

  Future<Response> login(String endPoint, Map<String, dynamic> data) async {
    try {
      final Response<dynamic> response = await dio.post(
        _baseUrl + endPoint,
        data: data,
      );

      // You might want to handle errors or status codes here if needed

      return response;
    } catch (e) {
      // Handle exceptions or errors here, if necessary
      rethrow;
    }
  }

  Future<Map<String,dynamic>> getPosts(String endPoint) async {
    final Response<dynamic> response = await dio.get(_baseUrl + endPoint);
    return response.data;
  }
}
