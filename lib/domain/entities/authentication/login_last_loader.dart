import 'package:equatable/equatable.dart';

class LoginLastLoader extends Equatable {
  final String? loaderId;
  final String? code;
  final String? operatorLoaderId;

  const LoginLastLoader({
    this.loaderId,
    this.code,
    this.operatorLoaderId,
  });

  @override
  List<Object?> get props => [
        loaderId,
        code,
        operatorLoaderId,
      ];
}
