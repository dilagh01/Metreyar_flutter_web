import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.homkar.ir"; // این رو به آدرس واقعی API خودت تغییر بده

  static Future<String> ping() async {
    final response = await http.get(Uri.parse('$baseUrl/ping'));
    if (response.statusCode == 200) {
      return "Ping successful!";
    } else {
      return "Ping failed: ${response.statusCode}";
    }
  }
}
