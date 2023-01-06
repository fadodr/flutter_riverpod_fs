import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:testapp/src/constants/enums.dart';
import '../../helpers/custom_exceptions.dart';
import './dio_exception.dart';
import './dio_interceptors.dart';

//http://10.0.2.2 for android

//http://18.193.47.125:3000/ deployed server

const baseUrl = "";

final httpServiceProvider =
    Provider<HttpService>((ref) => HttpService(ref: ref));

final flutterStorageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

class HttpService {
  HttpService({required this.ref}) {
    initAndAddInterceptors();
  }
  final Ref ref;

  Dio? _dio;
  static header() => {"Content-Type": "application/json"};

  void initAndAddInterceptors() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: header(),
        responseType: ResponseType.json,
      ),
    );

    _dio!.interceptors.add(DioInterceptor(
      storage: ref.watch(flutterStorageProvider),
      dio: _dio!,
      ref: ref,
    ));
  }

  Future<Response> request(
      {required String url, required HttpMethod method, dynamic params}) async {
    try {
      switch (method) {
        case HttpMethod.get:
          return await _dio!.get(url);
        case HttpMethod.post:
          return await _dio!.post(url, data: params);
        case HttpMethod.patch:
          return await _dio!.patch(url, data: params);
        case HttpMethod.delete:
          return await _dio!.delete(url);
        default:
          return await _dio!.get(url);
      }
    } on DioError catch (e) {
      throw DioException.fromDioError(e).message;
    } catch (e) {
      if (e is NoInternetException) {
        rethrow;
      }
      throw UnknownException(e.toString());
    }
  }
}
