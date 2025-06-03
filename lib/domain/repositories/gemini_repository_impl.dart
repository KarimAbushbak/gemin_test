import '../../data_source/remote_datasource.dart';
import '../../domain/entities/gemini_response.dart';
import '../../domain/repositories/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiRemoteDatasource remoteDatasource;

  GeminiRepositoryImpl(this.remoteDatasource);

  @override
  Future<GeminiResponse> sendPrompt(String prompt) {
    return remoteDatasource.sendPrompt(prompt);
  }
}
