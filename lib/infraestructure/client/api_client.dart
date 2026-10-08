import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servinet_movil/domain/exception/UnauthorizedException.dart';
import 'package:servinet_movil/infraestructure/load/load_data_app.dart';

class ApiClient {
  final String _baseUrl = LoadDataApp.baseUrl;

  Future<dynamic> get(String endpoint) async {
    final accessToken = await LoadDataApp.getAccessToken();

    if (accessToken == null) {
      throw UnauthorizedException(
        'No hay token de acceso inicia sesion para continuar',
      );
    }

    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    if (response.statusCode == 401) {
      throw UnauthorizedException('La sesión no es válida o ha expirado');
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

  Future<dynamic> postLogot(String endpoint) async {
    final accessToken = await LoadDataApp.getAccessToken();

    if (accessToken == null) {
      return;
    }
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw Exception('Error ${response.statusCode}: ${response.body}');
  }
}
