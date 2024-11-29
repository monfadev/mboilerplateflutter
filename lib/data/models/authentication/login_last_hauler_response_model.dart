import 'package:equatable/equatable.dart';
import 'package:mboilerplateflutter/core/common/extensions/safe_convert_extension.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last_hauler.dart';

class LoginLastHaulerResponseModel extends Equatable {
  final String? haulerId;
  final String? code;
  final String? operatorHaulerId;

  const LoginLastHaulerResponseModel({
    this.haulerId,
    this.code,
    this.operatorHaulerId,
  });

  factory LoginLastHaulerResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginLastHaulerResponseModel(
        haulerId: json.asString('hauler_id'),
        code: json.asString('code'),
        operatorHaulerId: json.asString('operator_hauler_id'),
      );

  LoginLastHauler toEntity() {
    return LoginLastHauler(
      haulerId: haulerId,
      code: code,
      operatorHaulerId: operatorHaulerId,
    );
  }

  @override
  List<Object?> get props => [
        haulerId,
        code,
        operatorHaulerId,
      ];
}
