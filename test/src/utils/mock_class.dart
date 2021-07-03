import 'package:flutter_arch_component/src/common/data/local/local_data_source.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}
