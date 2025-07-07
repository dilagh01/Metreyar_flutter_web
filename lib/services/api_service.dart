import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // مقدار BACKEND_URL از dart-define گرفته می‌شود
  static const String baseUrl = String.fromEnvironment('BACKEND_URL', defaultValue: 'https://api.homkar.ir');

  /// GET به مسیر `/hello`
  static Future<String> fetchHello() async {
    final url = Uri.parse('$baseUrl/hello');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'] ?? '✅ Success (no message)';
      } else {
        throw Exception('Server responded with status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }
}
