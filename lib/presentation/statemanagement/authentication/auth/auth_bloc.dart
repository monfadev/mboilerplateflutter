import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_response_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<AuthClearToken>(_onClearHydrated);
    on<AuthAddToken>(_onAddHydrated);
  }

  Future<void> _onAddHydrated(
    AuthAddToken event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthState(
        loginModel: event.loginModel,
      ),
    );
  }

  void _onClearHydrated(AuthClearToken event, Emitter<AuthState> emit) {
    emit(AuthState.initial());
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    return state.toJson();
  }
}
