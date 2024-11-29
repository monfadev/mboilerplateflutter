import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';
import 'package:mboilerplateflutter/data/datasources/authentication/authentication_remote_data_source.dart';
import 'package:mboilerplateflutter/data/models/response/exception.dart';
import 'package:mboilerplateflutter/data/services/api/network_client.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'authentication_mock_response.dart';

void main() {
  late NetworkClient networkClient;
  late MockDio mockDio;
  late AuthenticationRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();

    // Mock environment
    dotenv.testLoad(mergeWith: {'BASE_URL': 'https://development.com/'});

    // Mock interceptor
    final mockInterceptors = Interceptors();
    when(mockDio.interceptors).thenReturn(mockInterceptors);

    networkClient = NetworkClient(mockDio);
    dataSource = AuthenticationRemoteDataSourceImpl(client: networkClient);
  });

  group('post Login Tablet', () {
    test(
        'should return object of login tablet model when the response code is successful',
        () async {
      // arrange
      when(
        mockDio.post(
          any,
          options: anyNamed('options'),
          data: loginTabletRequestModel.toMap(),
        ),
      ).thenAnswer(
        (_) async => mockResponseLoginTabletSuccess,
      );

      // action
      final actual = await dataSource.postLogin(loginTabletRequestModel);

      // assert
      expect(actual, equals(loginTabletResponseExpected));
    });

    test(
        'should return DioExceptionType badResponse when the response format json with message',
        () async {
      // arrange
      when(
        mockDio.post(
          any,
          options: anyNamed('options'),
          data: loginTabletRequestModel.toMap(),
        ),
      ).thenThrow(
        DioException.badResponse(
          statusCode: 400,
          requestOptions: RequestOptions(),
          response: mockResponseLoginTabletError,
        ),
      );

      // action
      final actual = dataSource.postLogin(loginTabletRequestModel);

      expect(() async => actual, throwsA(isA<ServerException>()));
    });

    test(
        'should return DioExceptionType badResponse when the response format is body string',
        () async {
      // arrange
      when(
        mockDio.post(
          any,
          options: anyNamed('options'),
          data: loginTabletRequestModel.toMap(),
        ),
      ).thenThrow(
        DioException.badResponse(
          statusCode: 400,
          requestOptions: RequestOptions(),
          response: mockResponseUnexpectedFormat,
        ),
      );

      // action
      final actual = dataSource.postLogin(loginTabletRequestModel);

      expect(() async => actual, throwsA(isA<ServerException>()));
    });

    test('should return is DioExceptionType connectionError', () async {
      // arrange
      when(
        mockDio.post(
          any,
          options: anyNamed('options'),
          data: loginTabletRequestModel.toMap(),
        ),
      ).thenThrow(
        DioException.connectionError(
          requestOptions: RequestOptions(),
          reason: AppString.failedNetwork,
        ),
      );

      // action
      final actual = dataSource.postLogin(loginTabletRequestModel);

      expect(() async => actual, throwsA(isA<ServerException>()));
    });
  });
}
