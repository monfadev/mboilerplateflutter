import 'package:equatable/equatable.dart';
import 'package:mboilerplateflutter/core/common/extensions/safe_convert_extension.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_last_hauler_response_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_last_louder_response_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_last_response_model.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_tablet.dart';

class LoginTabletResponseModel extends Equatable {
  final String? id;
  final int? roleId;
  final String? roleName;
  final bool? isDefaultRole;
  final String? departmentId;
  final String? departmentName;
  final String? siteId;
  final String? siteName;
  final String? fleetId;
  final String? nik;
  final String? name;
  final String? email;
  final String? phone;
  final bool? isActive;
  final String? imageUrl;
  final String? unitId;
  final String? unitCode;
  final String? unitTypeId;
  final int? loginType;
  final int? loginStatus;
  final DateTime? loginAt;
  final int? lastTotalCycle;
  final int? lastTotalHauler;
  final String? lastCycleId;
  final String? lastActivityId;
  final LoginLastResponseModel? lastPit;
  final LoginLastHaulerResponseModel? lastHauler;
  final LoginLastLouderResponseModel? lastLoader;
  final LoginLastResponseModel? lastLoadingPoint;
  final LoginLastResponseModel? lastDumpingPoint;
  final LoginLastResponseModel? lastMaterial;
  final bool? cycleFinished;
  final bool? isDisposal;

  const LoginTabletResponseModel({
    this.id,
    this.roleId,
    this.roleName,
    this.isDefaultRole,
    this.departmentId,
    this.departmentName,
    this.siteId,
    this.siteName,
    this.fleetId,
    this.nik,
    this.name,
    this.email,
    this.phone,
    this.isActive,
    this.imageUrl,
    this.unitId,
    this.unitCode,
    this.unitTypeId,
    this.loginType,
    this.loginStatus,
    this.loginAt,
    this.lastTotalCycle,
    this.lastTotalHauler,
    this.lastCycleId,
    this.lastActivityId,
    this.lastPit,
    this.lastHauler,
    this.lastLoader,
    this.lastLoadingPoint,
    this.lastDumpingPoint,
    this.lastMaterial,
    this.cycleFinished,
    this.isDisposal,
  });

  LoginTabletResponseModel copyWith({
    String? id,
    String? unitId,
  }) =>
      LoginTabletResponseModel(
        id: id ?? this.id,
        unitId: unitId ?? this.unitId,
      );

  factory LoginTabletResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginTabletResponseModel(
        id: json.asString('id'),
        roleId: json.asInt('role_id'),
        roleName: json.asString('role_name'),
        isDefaultRole: json.asBool('is_default_role'),
        departmentId: json.asString('department_id'),
        departmentName: json.asString('department_name'),
        siteId: json.asString('site_id'),
        siteName: json.asString('site_name'),
        fleetId: json.asString('fleet_id'),
        nik: json.asString('nik'),
        name: json.asString('name'),
        email: json.asString('email'),
        phone: json.asString('phone'),
        isActive: json.asBool('is_active'),
        imageUrl: json.asString('image_url'),
        unitId: json.asString('unit_id'),
        unitCode: json.asString('unit_code'),
        unitTypeId: json.asString('unit_type_id'),
        loginType: json.asInt('login_type'),
        loginStatus: json.asInt('login_status'),
        loginAt:
            json['login_at'] == null ? null : DateTime.parse(json['login_at']),
        lastTotalCycle: json.asInt('last_total_cycle'),
        lastTotalHauler: json.asInt('last_total_hauler'),
        lastCycleId: json.asString('last_cycle_id'),
        lastActivityId: json.asString('last_activity_id'),
        lastPit: json['last_pit'] == null
            ? null
            : LoginLastResponseModel.fromMap(json['last_pit']),
        lastHauler: json['last_hauler'] == null
            ? null
            : LoginLastHaulerResponseModel.fromMap(json['last_hauler']),
        lastLoader: json['last_loader'] == null
            ? null
            : LoginLastLouderResponseModel.fromMap(json['last_loader']),
        lastLoadingPoint: json['last_loading_point'] == null
            ? null
            : LoginLastResponseModel.fromMap(json['last_loading_point']),
        lastDumpingPoint: json['last_dumping_point'] == null
            ? null
            : LoginLastResponseModel.fromMap(json['last_dumping_point']),
        lastMaterial: json['last_material'] == null
            ? null
            : LoginLastResponseModel.fromMap(json['last_material']),
        cycleFinished: json.asBool('cycle_finished'),
        isDisposal: json.asBool('is_disposal'),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'unit_id': unitId,
      };

  LoginTablet toEntity() {
    return LoginTablet(
      id: id,
      roleId: roleId,
      roleName: roleName,
      isDefaultRole: isDefaultRole,
      departmentId: departmentId,
      departmentName: departmentName,
      siteId: siteId,
      siteName: siteName,
      fleetId: fleetId,
      nik: nik,
      name: name,
      email: email,
      phone: phone,
      isActive: isActive,
      imageUrl: imageUrl,
      unitId: unitId,
      unitCode: unitCode,
      unitTypeId: unitTypeId,
      loginType: loginType,
      loginStatus: loginStatus,
      loginAt: loginAt,
      lastTotalCycle: lastTotalCycle,
      lastTotalHauler: lastTotalHauler,
      lastCycleId: lastCycleId,
      lastActivityId: lastActivityId,
      lastPit: lastPit?.toEntity(),
      lastHauler: lastHauler?.toEntity(),
      lastLoader: lastLoader?.toEntity(),
      lastLoadingPoint: lastLoadingPoint?.toEntity(),
      lastDumpingPoint: lastDumpingPoint?.toEntity(),
      lastMaterial: lastMaterial?.toEntity(),
      cycleFinished: cycleFinished,
      isDisposal: isDisposal,
    );
  }

  @override
  List<Object?> get props => [
        id,
        roleId,
        roleName,
        isDefaultRole,
        departmentId,
        departmentName,
        siteId,
        siteName,
        fleetId,
        nik,
        name,
        email,
        phone,
        isActive,
        imageUrl,
        unitId,
        unitCode,
        unitTypeId,
        loginType,
        loginStatus,
        loginAt,
        lastTotalCycle,
        lastTotalHauler,
        lastCycleId,
        lastActivityId,
        lastPit,
        lastHauler,
        lastLoader,
        lastLoadingPoint,
        lastDumpingPoint,
        lastMaterial,
        cycleFinished,
        isDisposal,
      ];
}
