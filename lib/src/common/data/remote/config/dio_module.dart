import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'api_url.dart';

class DioOptions extends BaseOptions {
  DioOptions()
      : super(
      baseUrl: ApiUrl.BASE_URL,
      contentType: Headers.jsonContentType,
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000);
}


class DioModule with DioMixin implements Dio {
  DioModule(BaseOptions ops,
      Interceptor loggingInterceptor, DefaultHttpClientAdapter adapter) {
    options = ops;
    interceptors.add(loggingInterceptor);
    httpClientAdapter = adapter;
  }
}
