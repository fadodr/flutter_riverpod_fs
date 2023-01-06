import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({required this.storage, required this.dio, required this.ref});
  final FlutterSecureStorage storage;
  final Dio dio;
  final Ref ref;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await storage.read(key: 'accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if ((err.response?.data['error'] == "jwt expired")) {
      await onJwtError(err, handler);
    } else {
      return super.onError(err, handler);
    }
  }

  Future<void> onJwtError(
      DioError error, ErrorInterceptorHandler handler) async {
    //retry and the request using the handler.resolve() method

    return handler.next(error);
  }
}
