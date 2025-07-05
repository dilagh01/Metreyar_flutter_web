Future<String> fetchHello() async {
  final response = await http.get(Uri.parse('https://api.homkar.ir/api/hello'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['message'];
  } else {
    throw Exception('Failed to load data from API');
  }
}
