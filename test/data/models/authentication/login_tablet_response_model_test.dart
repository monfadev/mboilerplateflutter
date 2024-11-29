import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_response_model.dart';

import '../../../dummy_data/dummy_data.dart';
import '../../../json_reader.dart';

void main() {
  group('Login Tablet Response Model', () {
    test('fromJson', () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('dummy_data/authentication/login_tablet_response_model.json'),
      );
      // act
      final result = LoginTabletResponseModel.fromMap(jsonMap['data']);
      // assert
      expect(result, tLoginTabletResponseModel);
    });

    test('copyWith', () {
      /// arrange
      final LoginTabletResponseModel login = tLoginTabletResponseModel;

      /// action
      final copyLogin = login.copyWith();

      expect(copyLogin, isA<LoginTabletResponseModel>());
    });

    test('toMap', () {
      /// arrange
      final LoginTabletResponseModel login = tLoginTabletResponseModel;

      /// action
      final json = login.toMap();

      /// assert
      final expectedJsonMap = {
        'id': 'userid',
        'unit_id': 'unitId',
      };

      expect(json, expectedJsonMap);
    });
  });
}
