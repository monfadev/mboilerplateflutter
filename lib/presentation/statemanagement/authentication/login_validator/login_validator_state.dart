part of 'login_validator_bloc.dart';

class LoginValidatorState extends Equatable {
  final InputValidationModel value;
  final bool isValid;

  const LoginValidatorState({
    this.value = const InputValidationModel.pure(),
    this.isValid = false,
  });

  @override
  List<Object> get props => [
        value,
        isValid,
      ];
}
