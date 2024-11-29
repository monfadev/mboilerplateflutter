import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_response_model.dart';
import 'package:mboilerplateflutter/presentation/statemanagement/authentication/auth/auth_bloc.dart';

import '../../../helpers/hydrated_bloc.dart';

void main() {
  initHydratedStorage();

  late AuthBloc authBloc;

  setUp(() {
    authBloc = AuthBloc();
  });

  group('Auth Bloc', () {
    test('initial state is correct', () {
      expect(authBloc.state, AuthState.initial());
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        expect(
          authBloc.fromJson(authBloc.toJson(authBloc.state)),
          isA<AuthState>(),
        );
      });
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthState] when AuthAddToken is success',
      build: () {
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const AuthAddToken(
          loginModel: LoginTabletResponseModel(),
        ),
      ),
      expect: () => [
        const AuthState(
          loginModel: LoginTabletResponseModel(),
        ),
      ],
      verify: (_) => [
        const AuthAddToken(
          loginModel: LoginTabletResponseModel(),
        ).props,
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthState] when AuthClearHydratedPressed is success',
      build: () {
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthClearToken()),
      expect: () => [
        AuthState.initial(),
      ],
    );
  });
}
