import '../../domain/entities/gemini_response.dart';

class GeminiResponseModel extends GeminiResponse {
  GeminiResponseModel({required String text}) : super(text: text);

  factory GeminiResponseModel.fromJson(Map<String, dynamic> json) {
    return GeminiResponseModel(
      text: json["candidates"][0]["content"]["parts"][0]["text"] ?? '',
    );
  }
}
