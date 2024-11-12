import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'https://api-dev-jdm.kitakale.id';

Future<Map<String, dynamic>> login(String username, String password) async {
  final url = '$_baseUrl/oauth/token';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'grant_type': 'password',
        'client_id': dotenv.env['CLIENT_ID'],
        'client_secret': dotenv.env['CLIENT_SECRET'],
        'username': 'owner@jdmstore.id',
        'password': 'password',
      
      }),
    );

   

    if (response.statusCode == 200) {
      return {'status': true, 'data': jsonDecode(response.body)};
    } else {
      return {
        'status': false,
        'message': jsonDecode(response.body)['error_description'] ??
            'Login failed'
      };
    }
  } catch (error) {
    return {'status': false, 'message': 'An error occurred: $error'};
  }
}
}