import '../entities/gemini_response.dart';

abstract class GeminiRepository {
  Future<GeminiResponse> sendPrompt(String prompt);
}
