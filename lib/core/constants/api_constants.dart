import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get baseUrl =>
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  static String get apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
}
