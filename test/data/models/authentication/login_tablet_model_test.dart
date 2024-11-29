import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_data.dart';

void main() {
  group('Login Tablet Model', () {
    test('should be a LoginTabletResponseModel entity', () async {
      final result = loginTabletResponseModel.toEntity();
      expect(result, loginTablet);
    });

    test('should be a subclass of LoginLast entity', () async {
      final result = loginTabletResponseModelLast.lastPit?.toEntity();
      expect(result, loginLast);
    });

    test('should be a subclass of LoginLastHauler entity', () async {
      final result = loginTabletResponseModelLast.lastHauler?.toEntity();
      expect(result, loginLastHauler);
    });

    test('should be a subclass of LoginLastLouder entity', () async {
      final result = loginTabletResponseModelLast.lastLoader?.toEntity();
      expect(result, loginLastLouder);
    });

    test('should be a subclass of LoginLast entity', () async {
      final result = loginTabletResponseModelLast.lastLoadingPoint?.toEntity();
      expect(result, loginLast);
    });

    test('should be a subclass of LoginLast entity', () async {
      final result = loginTabletResponseModelLast.lastDumpingPoint?.toEntity();
      expect(result, loginLast);
    });

    test('should be a subclass of LoginLast entity', () async {
      final result = loginTabletResponseModelLast.lastMaterial?.toEntity();
      expect(result, loginLast);
    });
  });
}
