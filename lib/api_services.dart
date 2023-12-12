import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> calculateBMI(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user-data'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getDietInfo() async {
    final response = await http.get(Uri.parse('$baseUrl/diet-info'));
    return jsonDecode(response.body);
  }
}
