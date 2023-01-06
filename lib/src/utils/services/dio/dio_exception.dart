import 'dart:io';
import 'package:dio/dio.dart';
import 'package:testapp/src/utils/helpers/custom_exceptions.dart';

class DioException implements Exception {
  late Object message;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = NoServiceFoundException('"Request to server was cancelled"');
        break;
      case DioErrorType.connectTimeout:
        message = NoServiceFoundException("Connection timeout");
        break;
      case DioErrorType.receiveTimeout:
        message = NoServiceFoundException("Receiving timeout occurred");
        break;
      case DioErrorType.sendTimeout:
        message = NoServiceFoundException("Request send timeout");
        break;
      case DioErrorType.response:
        message = UnknownException(dioError.response?.data['error']);
        break;
      case DioErrorType.other:
        if (dioError.error is SocketException) {
          message = NoInternetSocketException(
              "Please check your internet connection and try again");
          break;
        }
        if (dioError.error is FormatException) {
          message = InvalidFormatException("Bad response format");
          break;
        }
        message = UnknownException("Unexpected error occurred");
        break;
      default:
        message = UnknownException("Something went wrong");
    }
  }
}
