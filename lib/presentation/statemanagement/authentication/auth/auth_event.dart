part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthAddToken extends AuthEvent {
  final LoginTabletResponseModel loginModel;

  const AuthAddToken({
    required this.loginModel,
  });
}

final class AuthClearToken extends AuthEvent {}
