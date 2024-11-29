import 'package:dio/dio.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_response_model.dart';
import 'package:mboilerplateflutter/data/models/response/exception.dart';
import 'package:mboilerplateflutter/data/services/api/network_client.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginTabletResponseModel> postLogin(
    LoginTabletRequestModel request, {
    CancelToken? cancelToken,
  });
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final NetworkClient client;

  AuthenticationRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<LoginTabletResponseModel> postLogin(
    LoginTabletRequestModel request, {
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.dio.post(
        'login-tablet-unit',
        data: request.toMap(),
        cancelToken: cancelToken,
      );

      final model = LoginTabletResponseModel.fromMap(response.data['data']);
      return model;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        if (e.response?.data is String) {
          throw ServerException(message: 'Unexpected response format');
        } else {
          throw ServerException(message: e.response?.data['message']);
        }
      }

      throw ServerException(message: AppString.failureServer);
    }
  }
}
