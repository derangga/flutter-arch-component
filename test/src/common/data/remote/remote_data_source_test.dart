import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_arch_component/src/common/data/remote/config/dio_module.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../utils/file_reader.dart';
import 'dio_adapter_mock.dart';

void main() {
  final Dio dio = Dio(DioOptions());
  late DioAdapterMock dioAdapterMock;
  late RemoteDataSource remoteDataSource;
  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    remoteDataSource = RemoteDataSourceImpl(dio);
    registerFallbackValue(ReqiestOptionMock());
  });

  group("test fetchDiscoverMovies", () {
    test("test fetchDiscoverMovies and result is 200", () async {
      final responseJson = readJsonFromFile('discover_movie.json');
      final httpResponse =
          ResponseBody.fromString(responseJson, HttpStatus.ok, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      });

      when(() => dioAdapterMock.fetch(any(), any(), any()))
          .thenAnswer((invocation) async => httpResponse);

      final response = await remoteDataSource.fetchDiscoverMovies(1);
      expect(response.isLeft(), false);
      expect(response.isRight(), true);
    });

    test("test fetchDiscoverMovies and result is 500", () async {
      final errorJson = jsonEncode({"message": "internal server error"});
      final httpResponse = ResponseBody.fromString(
          errorJson, HttpStatus.internalServerError,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          });

      when(() => dioAdapterMock.fetch(any(), any(), any()))
          .thenAnswer((invocation) async => httpResponse);

      final response = await remoteDataSource.fetchDiscoverMovies(1);
      expect(response.isLeft(), true);
      expect(response.isRight(), false);
    });
  });

  group("test fetchDetailMovies", () {
    test("test fetchDetailMovies nad result is 200", () async {
      final responseJson = readJsonFromFile('detail_movie.json');
      final httpResponse =
          ResponseBody.fromString(responseJson, HttpStatus.ok, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      });

      when(() => dioAdapterMock.fetch(any(), any(), any()))
          .thenAnswer((invocation) async => httpResponse);

      final response = await remoteDataSource.fetchDetailMovies(1);
      expect(response.isLeft(), false);
      expect(response.isRight(), true);
    });

    test("test fetchDiscoverMovies and result is 500", () async {
      final errorJson = jsonEncode({"message": "internal server error"});
      final httpResponse = ResponseBody.fromString(
          errorJson, HttpStatus.internalServerError,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType]
          });

      when(() => dioAdapterMock.fetch(any(), any(), any()))
          .thenAnswer((invocation) async => httpResponse);

      final response = await remoteDataSource.fetchDetailMovies(1);
      expect(response.isLeft(), true);
      expect(response.isRight(), false);
    });
  });
}
