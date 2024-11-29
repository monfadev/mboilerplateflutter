import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigate = Navigation.instance;

class Navigation {
  Navigation._private();

  static Navigation instance = Navigation._private();

  factory Navigation() {
    return instance;
  }

  /// Global key to use in navigator
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigating to some screen using [routeName] and optional
  /// argument [data]
  void pushTo(
    String routeName, {
    Object? data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParams,
    Function(dynamic result)? onResult,
  }) {
    FirebaseCrashlytics.instance.log('pushTo $routeName - ${data.runtimeType}');

    Router.navigate(
      navigatorKey.currentContext!,
      () => navigatorKey.currentContext!
          .pushNamed(
        routeName,
        extra: data,
        pathParameters: pathParams ?? {},
        queryParameters: queryParams ?? {},
      )
          .then((result) {
        if (onResult != null) {
          onResult(result);
        }
      }),
    );
  }

  void pushToReplacement(
    String routeName, {
    Object? data,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParams,
  }) {
    FirebaseCrashlytics.instance
        .log('pushToReplacement $routeName - ${data.runtimeType}');

    Router.navigate(
      navigatorKey.currentContext!,
      () => navigatorKey.currentContext!.pushReplacementNamed(
        routeName,
        extra: data,
        pathParameters: pathParams ?? {},
        queryParameters: queryParams ?? {},
      ),
    );
  }

  /// Navigating to some screen using [routeName] and optional
  /// argument [data], this function include clear all navigation stack
  void pushToRemoveUntil(String routeName, {dynamic data}) {
    FirebaseCrashlytics.instance
        .log('pushToRemoveUntil $routeName - ${data.runtimeType}');

    Router.navigate(navigatorKey.currentContext!, () {
      while (navigatorKey.currentContext!.canPop()) {
        pop();
      }

      navigatorKey.currentContext!.pushReplacementNamed(routeName, extra: data);
    });
  }

  /// Navigating back using pop,
  /// with optional argument [data]
  dynamic pop({dynamic data}) {
    FirebaseCrashlytics.instance.log('pop');

    Router.navigate(
      navigatorKey.currentContext!,
      () => navigatorKey.currentContext!.pop(data),
    );
  }
}
