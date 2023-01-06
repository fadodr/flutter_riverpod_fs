import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../../helpers/multipart.dart';

Future<Response<dynamic>> retry(Dio dio, RequestOptions requestOptions) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  if (requestOptions.data is FormData) {
    final previousFormData = requestOptions.data as FormData;
    FormData formData = FormData();
    formData.fields.addAll(previousFormData.fields);
    for (MapEntry mapFile in previousFormData.files) {
      formData.files.add(MapEntry(
          mapFile.key,
          MultipartFileExtended.fromFile(mapFile.value.filePath,
              contentType: MediaType('image', 'jpeg'),
              filename: mapFile.value.filename)));
    }
    requestOptions.data = formData;
  }
  return dio.request<dynamic>(
    requestOptions.path,
    data: requestOptions.data,
    queryParameters: requestOptions.queryParameters,
    options: options,
  );
}
