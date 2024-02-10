import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'http://192.168.1.6:1337/api/';
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
      throw e;
    }
  }
}
