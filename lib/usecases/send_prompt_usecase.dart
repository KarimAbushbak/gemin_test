import '../domain/entities/gemini_response.dart';
import '../domain/repositories/gemini_repository.dart';

class SendPromptUseCase {
  final GeminiRepository repository;

  SendPromptUseCase(this.repository);

  Future<GeminiResponse> call(String prompt) {
    return repository.sendPrompt(prompt);
  }
}
