import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum Status { SUCCESS, ERROR }

class Result<T> {
  final int code;
  final Status status;
  final T body;
  final DioErrorType dioError;
  final dynamic errorBody;
  Result(
      {@required this.status,
      @required this.body,
      this.code = 0,
      this.dioError,
      this.errorBody});

  static Result<T> success<T>(T data) {
    return Result(status: Status.SUCCESS, body: data);
  }

  static Result<T> error<T>(
      DioErrorType dioError, int code, dynamic errorBody) {
    return Result(
        status: Status.ERROR,
        body: null,
        dioError: dioError,
        code: code,
        errorBody: errorBody);
  }
}
