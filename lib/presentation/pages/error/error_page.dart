import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mboilerplateflutter/core/common/utils/navigation/navigation.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('error_page_key'),
      body: Semantics(
        identifier: 'error_page',
        child: Center(
          child: Column(
            children: [
              const Text('Screen is not found'),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () async {
                  await HydratedBloc.storage.clear();

                  navigate.pushToRemoveUntil('install');
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
