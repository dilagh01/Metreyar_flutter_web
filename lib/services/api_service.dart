import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://metreyar.onrender.com';

  static Future<String> fetchHello() async {
    final response = await http.get(Uri.parse('$baseUrl/'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'] ?? 'No message';
    } else {
      throw Exception('Failed to load message');
    }
  }
}
