import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mboilerplateflutter/core/common/environment/environment.dart';
import 'package:mboilerplateflutter/locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initialize() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Environment.load();

  final bytes = sha256.convert(utf8.encode(Environment.bytesKey)).bytes;

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
    encryptionCipher: HydratedAesCipher(bytes),
  );

  setupLocator();

  await initializeFirebase();

  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(!kDebugMode);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

    return true;
  };

  FlutterNativeSplash.remove();
}

Future<void> initializeFirebase() async {}
