import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:servinet_movil/domain/exception/UnauthorizedException.dart';
import 'package:servinet_movil/infraestructure/load/load_data_app.dart';

class ApiClient {
  final String _baseUrl = LoadDataApp.baseUrl;

  Future<dynamic> get(String endpoint) async {
    debugPrint('-- -- -- - 3.1 Obteniendo token');
    final accessToken = await LoadDataApp.getAccessToken();
    debugPrint(' -- - -- - 3.2 Token obtenido: ${accessToken != null}');

    if (accessToken == null) {
      throw UnauthorizedException(
        'No hay token de acceso inicia sesion para continuar',
      );
    }
    debugPrint(' - -- -- -- -- -3.3 Enviando petición: $_baseUrl$endpoint');
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    debugPrint(' ----  - --- -- -3.4 HTTP status: ${response.statusCode}');
    debugPrint('  - - - - --  - --3.5 HTTP body: ${response.body}');
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    if (response.statusCode == 401) {
      await LoadDataApp.clearTokens();
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
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw Exception('Error ${response.statusCode}: ${response.body}');
  }
}
