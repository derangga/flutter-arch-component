import 'package:dio/dio.dart';

class Failure {
  final dynamic errorBody;
  final int? code;
  final DioErrorType? dioError;

  Failure({this.errorBody, this.code, this.dioError});
}