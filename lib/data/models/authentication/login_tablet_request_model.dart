import 'package:equatable/equatable.dart';

class LoginTabletRequestModel extends Equatable {
  final String? unitId;
  final String? nik;
  final String? shifId;
  final int? loginType;

  const LoginTabletRequestModel({
    this.unitId,
    this.nik,
    this.shifId,
    this.loginType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'unit_id': unitId,
      'nik': nik,
      'shift_id': shifId,
      'login_type': loginType,
    };
  }

  @override
  List<Object?> get props => [
        unitId,
        nik,
        shifId,
        loginType,
      ];
}
