import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  // final _baseUrl = 'https://www.googleapis.com/books/v1/volumes?';
  final _baseUrl = 'http://192.168.56.1:8000/api/book/';

final Dio _dio;

  Future<dynamic> get({required String endPint}) async { //
    // var response = await _dio.get('$_baseUrl$endPint');
    var response = await _dio.get(_baseUrl);
    return response.data;
  } 
}
