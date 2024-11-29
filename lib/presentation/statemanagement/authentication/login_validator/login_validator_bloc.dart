import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mboilerplateflutter/core/common/utils/validation/input_validation_model.dart';

part 'login_validator_event.dart';
part 'login_validator_state.dart';

class LoginValidatorBloc
    extends Bloc<LoginValidatorEvent, LoginValidatorState> {
  LoginValidatorBloc() : super(const LoginValidatorState()) {
    on<LoginValidatorChanged>(_loginValidatorChanged);
  }

  void _loginValidatorChanged(
    LoginValidatorChanged event,
    Emitter<LoginValidatorState> emit,
  ) {
    final nik = InputValidationModel.dirty(event.nik.trim());

    emit(
      LoginValidatorState(
        value: nik,
        isValid: Formz.validate([nik]),
      ),
    );
  }
}
