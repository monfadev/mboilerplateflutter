import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<String> load() async {
    const String environment = String.fromEnvironment(
      'ENV',
      defaultValue: 'development',
    );

    await dotenv.load(
      fileName: 'lib/core/common/environment/$environment.env',
    );

    return environment;
  }

  static String get bytesKey => dotenv.get('BYTES_KEY');
  static String get baseUrl => dotenv.get('BASE_URL');
  static String get baseUrlWS => dotenv.get('BASE_URL_WS');
  static String get basePrefixWS => dotenv.get('BASE_PREFIX_WS');
}
