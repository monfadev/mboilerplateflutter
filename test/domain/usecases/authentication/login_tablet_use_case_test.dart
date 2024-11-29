import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/domain/usecases/authentication/post_login_tablet_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late PostLoginTabletUseCase usecase;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    usecase = PostLoginTabletUseCase(mockAuthenticationRepository);
  });

  test('should post login tablet from the repository', () async {
    // arrange
    when(mockAuthenticationRepository.postLogin(loginTabletRequestModel))
        .thenAnswer(
      (_) async => const Right(loginTablet),
    );
    // action
    final result = await usecase.execute(loginTabletRequestModel);
    // assert
    expect(
      result,
      const Right(loginTablet),
    );
  });
}
