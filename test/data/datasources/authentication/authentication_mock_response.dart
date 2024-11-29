import 'package:dio/dio.dart';

import '../../../dummy_data/dummy_data.dart';

Response mockResponseLoginTabletSuccess = Response(
  requestOptions: RequestOptions(),
  statusCode: 200,
  data: loginTabletResponse,
);

Response mockResponseLoginTabletError = Response(
  requestOptions: RequestOptions(),
  statusCode: 400,
  data: loginTabletResponseError,
);

Response mockResponseUnexpectedFormat = Response(
  requestOptions: RequestOptions(),
  statusCode: 400,
  data: 'Unexpected response format',
);
