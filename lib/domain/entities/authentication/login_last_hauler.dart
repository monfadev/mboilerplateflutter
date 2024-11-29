import 'package:equatable/equatable.dart';

class LoginLastHauler extends Equatable {
  final String? haulerId;
  final String? code;
  final String? operatorHaulerId;

  const LoginLastHauler({
    this.haulerId,
    this.code,
    this.operatorHaulerId,
  });

  @override
  List<Object?> get props => [
        haulerId,
        code,
        operatorHaulerId,
      ];
}
