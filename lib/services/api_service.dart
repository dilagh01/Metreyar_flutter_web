import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiService {
  Future<List<dynamic>> fetchItems() async {
    final response = await http.get(Uri.parse('$backendUrl/api/items'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  Future<bool> sendItem(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$backendUrl/api/items'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return response.statusCode == 200;
  }
}
