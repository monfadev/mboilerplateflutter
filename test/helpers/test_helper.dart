import 'package:dio/dio.dart';
import 'package:mboilerplateflutter/data/datasources/authentication/authentication_remote_data_source.dart';
import 'package:mboilerplateflutter/domain/repositories/authentication/authentication_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AuthenticationRepository,
    AuthenticationRemoteDataSource,
  ],
  customMocks: [MockSpec<Dio>()],
)
void main() {}
