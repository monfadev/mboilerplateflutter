import 'package:equatable/equatable.dart';
import 'package:mboilerplateflutter/core/common/extensions/safe_convert_extension.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last.dart';

class LoginLastResponseModel extends Equatable {
  final String? id;
  final String? name;

  const LoginLastResponseModel({
    this.id,
    this.name,
  });

  factory LoginLastResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginLastResponseModel(
        id: json.asString('id'),
        name: json.asString('name'),
      );

  LoginLast toEntity() {
    return LoginLast(id: id, name: name);
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
