import 'package:dio/dio.dart';

abstract class Failure {

  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'the connection is timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'the send is timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'the receive is timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'the bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponseError(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'the request to Api Server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errMessage:
                'no Internet Connection, check your connection and try again');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'unexpected error,please try again');
      default:
        return ServerFailure(
            errMessage: 'OOOPS there was an error, please try again ');
    }
  }

  factory ServerFailure.fromResponseError(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'You request is not found ,please try later ');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'internal server eroor ,please try later ');
    } else {
      return ServerFailure(
          errMessage: 'OOOPS there was an error, please try again ');
    }
  }
}
