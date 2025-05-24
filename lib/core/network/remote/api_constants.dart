import 'package:flutter_dotenv/flutter_dotenv.dart';

// api_constants.dart
// This file contains constants for API base URLs, endpoints, and keys.

class ApiConstants {
  static const String baseUrl = 'https://newsapi.org/v2';
  static String get apiKey => dotenv.env['NEWS_API_KEY'] ?? '';
  static const String topHeadlines = '/top-headlines';
  static const String sources = '/sources';
}
