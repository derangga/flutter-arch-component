import 'package:dio/dio.dart';
import 'config/network_func.dart';
import 'config/result.dart';

abstract class BaseRepository {
  final Dio _dio;

  BaseRepository(this._dio);

  Future<Result<T>> getMethod<T>(
    String endpoint, {
    Map<String, String> headers,
    ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response =
        await safeCallApi(_dio.get(endpoint, options: opsi), converter);
    return response;
  }

  Future<Result<T>> postMethod<T>(String endpoint,
      {Map<String, dynamic> headers,
      Map<String, dynamic> body,
      ResponseConverter<T> converter}) async {
    Options opsi = Options(headers: headers);
    var response = await safeCallApi<T>(
        _dio.post(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Result<T>> putMethod<T>(
    String endpoint, {
    Map<String, dynamic> headers,
    Map<String, dynamic> body,
    ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response = await safeCallApi(
        _dio.put(endpoint, data: body, options: opsi), converter);
    return response;
  }

  Future<Result<T>> deleteMethod<T>(
    String endpoint, {
    Map<String, String> headers,
    Map<String, dynamic> body,
    ResponseConverter<T> converter,
  }) async {
    Options opsi = Options(headers: headers);
    var response = await safeCallApi(
        _dio.delete(endpoint, data: body, options: opsi), converter);
    return response;
  }
}
