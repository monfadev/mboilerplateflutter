import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';
import 'package:mboilerplateflutter/data/models/response/failure.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_tablet.dart';
import 'package:mboilerplateflutter/domain/repositories/authentication/authentication_repository.dart';

class PostLoginTabletUseCase {
  final AuthenticationRepository repository;

  PostLoginTabletUseCase(this.repository);

  Future<Either<Failure, LoginTablet>> execute(
    LoginTabletRequestModel request, {
    CancelToken? cancelToken,
  }) {
    return repository.postLogin(
      request,
      cancelToken: cancelToken,
    );
  }
}
