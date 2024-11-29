import 'package:dio/dio.dart';
import 'package:mboilerplateflutter/core/common/environment/environment.dart';
import 'package:mboilerplateflutter/data/services/api/interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient {
  final Dio dio;

  NetworkClient(this.dio) {
    dio.interceptors.add(CustomInterceptors());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    dio.options = BaseOptions(
      baseUrl: Environment.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
  }
}
