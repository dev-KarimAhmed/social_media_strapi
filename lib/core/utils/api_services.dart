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

  Future<Map<String, dynamic>> getPosts(String endPoint, String token) async {
    final Response<dynamic> response = await dio.get(_baseUrl + endPoint,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> deletePost(String endPoint, String token) async {
    final Response<dynamic> response = await dio.delete(_baseUrl + endPoint,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    return response.data;
  }

  Future<Response> post(
      String endPoint, String token, Map<String, dynamic> data) async {
    try {
      final Response<dynamic> response = await dio.post(_baseUrl + endPoint,
          data: data,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          )
          // You can also add other options like headers if needed
          );

      // You might want to handle errors or status codes here if needed

      return response;
    } catch (e) {
      // Handle exceptions or errors here, if necessary
      rethrow;
    }
  }

  Future<Response> uploadImageToPost(
      String endPoint, String token, Map<String, dynamic> data) async {
    try {
      Dio dio = Dio(); // Initialize Dio instance

      // Prepare headers
      Options options = Options(
        headers: {'Authorization': 'Bearer $token'},
      );

      // Make FormData if files are provided
      FormData formData = FormData();

      // Merge data with formData
      formData.fields
          .addAll(data.entries.map((e) => MapEntry(e.key, e.value.toString())));

      final Response<dynamic> response = await dio.post(
        _baseUrl + endPoint,
        data: formData,
        options: options,
      );

      // You might want to handle errors or status codes here if needed

      return response;
    } catch (e) {
      // Handle exceptions or errors here, if necessary
      rethrow;
    }
  }
}

/**
 *  {
  "data": {
    "name": "Without image2d",
    "description": "image test2",
    "User":9
  }
}

 */
