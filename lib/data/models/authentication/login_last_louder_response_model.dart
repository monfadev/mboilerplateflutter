import 'package:equatable/equatable.dart';
import 'package:mboilerplateflutter/core/common/extensions/safe_convert_extension.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last_loader.dart';

class LoginLastLouderResponseModel extends Equatable {
  final String? loaderId;
  final String? code;
  final String? operatorLoaderId;

  const LoginLastLouderResponseModel({
    this.loaderId,
    this.code,
    this.operatorLoaderId,
  });

  factory LoginLastLouderResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginLastLouderResponseModel(
        loaderId: json.asString('loader_id'),
        code: json.asString('code'),
        operatorLoaderId: json.asString('operator_loader_id'),
      );

  LoginLastLoader toEntity() {
    return LoginLastLoader(
      loaderId: loaderId,
      code: code,
      operatorLoaderId: operatorLoaderId,
    );
  }

  @override
  List<Object?> get props => [
        loaderId,
        code,
        operatorLoaderId,
      ];
}
