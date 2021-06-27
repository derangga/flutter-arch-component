import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class ReqiestOptionMock extends Mock implements RequestOptions {}
