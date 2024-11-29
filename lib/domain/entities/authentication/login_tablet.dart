import 'package:equatable/equatable.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last_hauler.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last_loader.dart';

class LoginTablet extends Equatable {
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
  final LoginLast? lastPit;
  final LoginLastHauler? lastHauler;
  final LoginLastLoader? lastLoader;
  final LoginLast? lastLoadingPoint;
  final LoginLast? lastDumpingPoint;
  final LoginLast? lastMaterial;
  final bool? cycleFinished;
  final bool? isDisposal;

  const LoginTablet({
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
