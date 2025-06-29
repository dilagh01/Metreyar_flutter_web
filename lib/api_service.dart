import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.homkar.ir";

  static Future<String> ping() async {
    final response = await http.get(Uri.parse('$baseUrl/'));
    return response.statusCode == 200 ? "اتصال موفق" : "اتصال ناموفق";
  }
}