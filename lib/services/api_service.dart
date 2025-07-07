import 'package:http/http.dart' as http;

class ApiService {
  static final String baseUrl = const String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'https://api.homkar.ir',
  );

  static Future<String> ping() async {
    final response = await http.get(Uri.parse('$baseUrl/ping'));
    if (response.statusCode == 200) {
      return "Ping successful!";
    } else {
      return "Ping failed: ${response.statusCode}";
    }
  }
}
