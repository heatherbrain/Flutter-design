import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'https://api-dev-jdm.kitakale.id';

 Future<Map<String, dynamic>> login(String email, String password) async {
  final url = '$_baseUrl/oauth/token';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        // 'grant_type': 'password',
        // 'client_id': dotenv.env['CLIENT_ID'],
        // 'client_secret': dotenv.env['CLIENT_SECRET'],
        // 'username': email,
        // 'password': password,
        'grant_type': 'password',
        'client_id': '9affec99-1424-4a3e-91d9-a9449b3a28f2',
        'client_secret': 'U8uq51bCDGtIbof6oMA6K5Z8Mtkb3pttBQfJhR2l',
        'username': 'owner@jdmstore.id',
        'password': 'password',
      }),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

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