import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';
import 'package:mboilerplateflutter/data/models/response/failure.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_tablet.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginTablet>> postLogin(
    LoginTabletRequestModel request, {
    CancelToken? cancelToken,
  });
}
