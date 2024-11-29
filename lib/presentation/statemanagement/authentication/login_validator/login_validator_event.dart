part of 'login_validator_bloc.dart';

sealed class LoginValidatorEvent extends Equatable {
  const LoginValidatorEvent();

  @override
  List<Object> get props => [];
}

class LoginValidatorChanged extends LoginValidatorEvent {
  final String nik;

  const LoginValidatorChanged(
    this.nik,
  );
}
