import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'api_url.dart';
import 'logging_interceptor.dart';

class DioModule with DioMixin implements Dio {
  DioModule._([BaseOptions options]) {
    options = BaseOptions(
      baseUrl: ApiUrl.BASE_URL,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(LoggingInterceptor());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => DioModule._();
}
