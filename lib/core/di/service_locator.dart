import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../data_source/remote_datasource.dart';
import '../../domain/repositories/gemini_repository.dart';
import '../../domain/repositories/gemini_repository_impl.dart';
import '../../presentation/providers/chat_bloc.dart';
import '../../usecases/send_prompt_usecase.dart';

final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton(() => GeminiRemoteDatasource(sl()));

  // Repositories
  sl.registerLazySingleton<GeminiRepository>(() => GeminiRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => SendPromptUseCase(sl()));

  // Bloc
  sl.registerFactory(() => ChatBloc(sl()));
}
