import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static String get appBaseUrl {
    return dotenv.env['BASE_URL'] ?? 'BASE_URL not found';
  }

  static String get googleApiKey {
    return dotenv.env['GOOGLE_API_KEY'] ?? 'API_KEY not found';
  }

  static String get googleApiKeyIos {
    return dotenv.env['GOOGLE_API_KEY_IOS'] ?? 'API_KEY not found';
  }
}
