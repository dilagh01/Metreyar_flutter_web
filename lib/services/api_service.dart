import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.homkar.ir';

  static Future<String> fetchHello() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/hello'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'] ?? 'No message found';
      } else {
        throw Exception('Server responded with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }
}
