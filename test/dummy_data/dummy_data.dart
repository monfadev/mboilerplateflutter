import 'dart:convert';

import 'package:mboilerplateflutter/data/models/authentication/login_last_hauler_response_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_last_louder_response_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_last_response_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_request_model.dart';
import 'package:mboilerplateflutter/data/models/authentication/login_tablet_response_model.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last_hauler.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_last_loader.dart';
import 'package:mboilerplateflutter/domain/entities/authentication/login_tablet.dart';

import '../json_reader.dart';

const loginTabletRequestModel = LoginTabletRequestModel(
  unitId: 'unitId',
  nik: '123',
  shifId: '1',
  loginType: 1,
);

const loginTabletResponseModel = LoginTabletResponseModel();
const loginTablet = LoginTablet();

const loginTabletResponseModelLast = LoginTabletResponseModel(
  lastHauler: LoginLastHaulerResponseModel(),
  lastLoader: LoginLastLouderResponseModel(),
  lastPit: LoginLastResponseModel(),
  lastLoadingPoint: LoginLastResponseModel(),
  lastDumpingPoint: LoginLastResponseModel(),
  lastMaterial: LoginLastResponseModel(),
);

const loginLast = LoginLast();
const loginLastHauler = LoginLastHauler();
const loginLastLouder = LoginLastLoader();

final loginTabletResponse = json.decode(
  readJson('dummy_data/authentication/login_tablet_response_model.json'),
);

final loginTabletResponseExpected = LoginTabletResponseModel.fromMap(
  loginTabletResponse['data'],
);

final loginTabletResponseError = json.decode(
  readJson('dummy_data/authentication/login_tablet_response_error.json'),
);

final tLoginTabletResponseModel = LoginTabletResponseModel(
  id: 'userid',
  roleId: 29,
  roleName: 'Operator',
  isDefaultRole: false,
  departmentId: 'OPE',
  departmentName: 'Operation',
  siteId: '001D',
  siteName: 'Head Office Jakarta',
  fleetId: '',
  nik: 'userid',
  name: 'userid',
  email: 'userid@gmail.com',
  phone: '081762192134',
  isActive: true,
  imageUrl: 'imageUrl',
  unitId: 'unitId',
  unitCode: 'unitCode',
  unitTypeId: 'unitId',
  loginType: 1,
  loginStatus: 2,
  loginAt: DateTime.parse('2024-11-12T08:52:50.448256457Z'),
  lastTotalCycle: 0,
  lastTotalHauler: 0,
  lastCycleId: '',
  lastActivityId: '',
  cycleFinished: false,
  lastPit: const LoginLastResponseModel(
    id: '',
    name: '',
  ),
  lastHauler: const LoginLastHaulerResponseModel(
    haulerId: '',
    code: '',
    operatorHaulerId: '',
  ),
  lastLoader: const LoginLastLouderResponseModel(
    loaderId: '',
    code: '',
    operatorLoaderId: '',
  ),
  lastLoadingPoint: const LoginLastResponseModel(
    id: '',
    name: '',
  ),
  lastDumpingPoint: const LoginLastResponseModel(
    id: '',
    name: '',
  ),
  lastMaterial: const LoginLastResponseModel(
    id: '',
    name: '',
  ),
  isDisposal: false,
);
