import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testapp/src/constants/enums.dart';
import 'package:testapp/src/utils/helpers/custom_exceptions.dart';

class Http {
  Future<http.Response> request(
      {required String url,
      required HttpMethod method,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    try {
      switch (method) {
        case HttpMethod.get:
          return await http.get(Uri.parse(url), headers: headers);
        case HttpMethod.post:
          return await http.post(Uri.parse(url),
              body: params, headers: headers);
        default:
          return await http.get(Uri.parse(url));
      }
    } on SocketException catch (_) {
      throw NoInternetSocketException(
          'Please check your internet connection and try again');
    } on FormatException catch (_) {
      throw InvalidFormatException("Bad response format");
    } catch (error) {
      if (error is NoInternetException) {
        rethrow;
      }
      throw UnknownException(error.toString());
    }
  }
}
