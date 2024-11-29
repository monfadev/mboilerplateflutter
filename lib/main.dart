import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';
import 'package:mboilerplateflutter/core/common/constants/app_theme.dart';
import 'package:mboilerplateflutter/core/common/utils/navigation/navigation.dart';
import 'package:mboilerplateflutter/core/routes/app_route_generator.dart';
import 'package:mboilerplateflutter/initialize.dart';
import 'package:mboilerplateflutter/presentation/statemanagement/authentication/auth/auth_bloc.dart';

void main() async {
  await initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> precacheAssets() async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final rawAssets = json.decode(manifestJson) as Map<String, dynamic>;
    final images = rawAssets.keys
        .where((String key) => key.startsWith('assets/images'))
        .toList();

    final List<String> assets = [];
    assets.addAll(images);

    for (final asset in assets) {
      try {
        if (asset.contains('.png') ||
            asset.contains('.jpg') ||
            asset.contains('.jpeg')) {
          if (mounted) await precacheImage(AssetImage(asset), context);
        }
      } catch (e) {
        continue;
      }
    }
  }

  @override
  void didChangeDependencies() {
    precacheAssets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state.loginModel.id?.isNotEmpty ?? false) {
            await Future.delayed(const Duration(seconds: 3));

            navigate.pushToRemoveUntil('home');
          }
        },
        child: MaterialApp.router(
          title: AppString.titleName,
          theme: AppTheme.darkTheme,
          routeInformationProvider:
              RouterGenerator.router.routeInformationProvider,
          routeInformationParser: RouterGenerator.router.routeInformationParser,
          routerDelegate: RouterGenerator.router.routerDelegate,
          builder: (ctx, child) {
            child = MediaQuery.withClampedTextScaling(
              minScaleFactor: 1.0,
              maxScaleFactor: 1.0,
              child: child!,
            );

            return child;
          },
        ),
      ),
    );
  }
}
