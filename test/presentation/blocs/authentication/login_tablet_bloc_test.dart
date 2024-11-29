import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';
import 'package:mboilerplateflutter/data/models/response/failure.dart';
import 'package:mboilerplateflutter/domain/usecases/authentication/post_login_tablet_use_case.dart';
import 'package:mboilerplateflutter/presentation/statemanagement/authentication/login_tablet/login_tablet_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_data.dart';
import 'login_tablet_bloc_test.mocks.dart';

@GenerateMocks([
  PostLoginTabletUseCase,
  CancelToken,
])
void main() {
  late LoginTabletBloc loginTabletBloc;
  late MockPostLoginTabletUseCase mockPostLoginTabletUseCase;
  late MockCancelToken mockCancelToken;

  setUp(() {
    mockPostLoginTabletUseCase = MockPostLoginTabletUseCase();
    mockCancelToken = MockCancelToken();
    loginTabletBloc = LoginTabletBloc(
      postLoginTabletUseCase: mockPostLoginTabletUseCase,
      cancelToken: mockCancelToken,
    );
  });

  group('Login Tablet Bloc', () {
    test('initial state is correct', () {
      expect(loginTabletBloc.state, LoginTabletInitial());
    });

    blocTest<LoginTabletBloc, LoginTabletState>(
      'Should emit [Loading, Success] when data is gotten succesfully',
      build: () {
        when(mockPostLoginTabletUseCase.execute(loginTabletRequestModel))
            .thenAnswer((_) async => const Right(loginTablet));
        return loginTabletBloc;
      },
      act: (bloc) =>
          bloc.add(const LoginTabletPressed(request: loginTabletRequestModel)),
      expect: () => [
        LoginTabletLoading(),
        const LoginTabletSuccess(result: loginTablet),
      ],
      verify: (_) => [
        verify(mockPostLoginTabletUseCase.execute(loginTabletRequestModel)),
        const LoginTabletPressed(request: loginTabletRequestModel).props,
      ],
    );

    blocTest<LoginTabletBloc, LoginTabletState>(
      'Should emit [Loading, Failure] when get forgot password is unsuccessful',
      build: () {
        when(mockPostLoginTabletUseCase.execute(loginTabletRequestModel))
            .thenAnswer(
          (_) async => const Left(ServerFailure(AppString.failureServer)),
        );
        return loginTabletBloc;
      },
      act: (bloc) =>
          bloc.add(const LoginTabletPressed(request: loginTabletRequestModel)),
      expect: () => [
        LoginTabletLoading(),
        const LoginTabletFailure(AppString.failureServer),
      ],
      verify: (_) => [
        verify(mockPostLoginTabletUseCase.execute(loginTabletRequestModel)),
        const LoginTabletPressed(request: loginTabletRequestModel).props,
      ],
    );
  });

  group('Cancel Request', () {
    test('should call cancel on the CancelToken with the correct message', () {
      // Arrange
      when(mockCancelToken.cancel(any)).thenAnswer((_) => Future.value());

      // Act
      loginTabletBloc.cancelRequest();

      // Assert
      verify(mockCancelToken.cancel('Request canceled on login tablet bloc'))
          .called(1);
    });

    test('should not call cancel if cancelToken is null', () {
      // Arrange
      loginTabletBloc.cancelToken = null;

      // Act
      loginTabletBloc.cancelRequest();

      // Assert
      verifyNever(mockCancelToken.cancel(any));
    });
  });
}
