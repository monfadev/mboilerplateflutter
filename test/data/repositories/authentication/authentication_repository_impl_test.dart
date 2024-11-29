import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';
import 'package:mboilerplateflutter/data/models/response/exception.dart';
import 'package:mboilerplateflutter/data/models/response/failure.dart';
import 'package:mboilerplateflutter/data/repositories/authentication/authentication_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late AuthenticationRepositoryImpl repository;
  late MockAuthenticationRemoteDataSource mockAuthenticationRemoteDataSource;

  setUp(() {
    mockAuthenticationRemoteDataSource = MockAuthenticationRemoteDataSource();
    repository = AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: mockAuthenticationRemoteDataSource,
    );
  });

  group('Login Tablet', () {
    test(
        'should return login tablet when the call to remote data source is successful',
        () async {
      // arrange
      when(
        mockAuthenticationRemoteDataSource.postLogin(loginTabletRequestModel),
      ).thenAnswer((_) async => loginTabletResponseModel);
      // act
      final result = await repository.postLogin(loginTabletRequestModel);
      // assert
      verify(
        mockAuthenticationRemoteDataSource.postLogin(loginTabletRequestModel),
      );
      expect(result, equals(const Right(loginTablet)));
    });
  });

  test(
      'should return Server Failure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockAuthenticationRemoteDataSource.postLogin(loginTabletRequestModel))
        .thenThrow(ServerException(message: AppString.failureServer));
    // act
    final result = await repository.postLogin(loginTabletRequestModel);
    // assert
    verify(
      mockAuthenticationRemoteDataSource.postLogin(loginTabletRequestModel),
    );
    expect(result, equals(const Left(ServerFailure(AppString.failureServer))));
  });

  test(
      'should return Connection Failure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockAuthenticationRemoteDataSource.postLogin(loginTabletRequestModel))
        .thenThrow(const SocketException(AppString.failedNetwork));
    // act
    final result = await repository.postLogin(loginTabletRequestModel);
    // assert
    verify(
      mockAuthenticationRemoteDataSource.postLogin(loginTabletRequestModel),
    );
    expect(
      result,
      equals(const Left(ConnectionFailure(AppString.failedNetwork))),
    );
  });
}
