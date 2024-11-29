import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';
import 'package:mboilerplateflutter/data/datasources/authentication/authentication_remote_data_source.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';
import 'package:mboilerplateflutter/data/models/response/exception.dart';
import 'package:mboilerplateflutter/data/models/response/failure.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_tablet.dart';
import 'package:mboilerplateflutter/domain/repositories/authentication/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({required this.authenticationRemoteDataSource});

  @override
  Future<Either<Failure, LoginTablet>> postLogin(
    LoginTabletRequestModel request, {
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await authenticationRemoteDataSource.postLogin(
        request,
        cancelToken: cancelToken,
      );
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure(AppString.failedNetwork));
    }
  }
}
