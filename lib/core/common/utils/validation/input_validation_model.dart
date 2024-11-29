import 'package:formz/formz.dart';

enum InputValidationError { empty, failure }

class InputValidationModel extends FormzInput<String, InputValidationError> {
  const InputValidationModel.pure() : super.pure('');
  const InputValidationModel.dirty([super.value = '']) : super.dirty();

  @override
  InputValidationError? validator(String value) {
    if (value.isEmpty) {
      return InputValidationError.empty;
    }

    return null;
  }
}
