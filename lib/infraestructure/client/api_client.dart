import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servinet_movil/infraestructure/load/load_data_app.dart';

class ApiClient {
  final String _baseUrl = LoadDataApp.baseUrl;

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw Exception('Error ${response.statusCode}: ${response.body}');
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw Exception('Error ${response.statusCode}: ${response.body}');
  }
}
