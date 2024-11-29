part of 'login_tablet_bloc.dart';

sealed class LoginTabletState extends Equatable {
  const LoginTabletState();

  @override
  List<Object> get props => [];
}

final class LoginTabletInitial extends LoginTabletState {}

final class LoginTabletLoading extends LoginTabletState {}

final class LoginTabletSuccess extends LoginTabletState {
  final LoginTablet result;

  const LoginTabletSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

final class LoginTabletFailure extends LoginTabletState {
  final String message;

  const LoginTabletFailure(this.message);

  @override
  List<Object> get props => [message];
}
