import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://metreyar_api.onrender.com"; // این رو به آدرس واقعی API خودت تغییر بده

  static Future<String> ping() async {
    final response = await http.get(Uri.parse('$baseUrl/ping'));
    if (response.statusCode == 200) {
      return "Ping successful!";
    } else {
      return "Ping failed: ${response.statusCode}";
    }
  }
}
