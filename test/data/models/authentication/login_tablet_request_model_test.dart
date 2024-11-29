import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';

void main() {
  const LoginTabletRequestModel request = LoginTabletRequestModel();

  group('Login Tablet Request Model', () {
    test('should return method fromJson and toMap work correctly', () {
      /// action
      final json = request.toMap();

      /// assert
      expect(json, isNotNull);
    });

    test('should return comparing object with props', () {
      /// arrange
      const obj1 = request;

      const obj2 = request;

      expect(obj1.props, equals(obj2.props));
    });
  });
}
