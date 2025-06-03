import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constants/api_constants.dart';
import '../models/gemini_response_model.dart';

class GeminiRemoteDatasource {
  final http.Client client;

  GeminiRemoteDatasource(this.client);

  Future<GeminiResponseModel> sendPrompt(String prompt) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}?key=${ApiConstants.apiKey}');

    final response = await client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      return GeminiResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get response: ${response.body}');
    }
  }
}
