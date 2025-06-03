import 'package:flutter_bloc/flutter_bloc.dart';

import '../../usecases/send_prompt_usecase.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendPromptUseCase useCase;

  ChatBloc(this.useCase) : super(ChatInitial()) {
    on<SendMessageEvent>((event, emit) async {
      emit(ChatLoading());
      try {
        final result = await useCase(event.message);
        emit(ChatSuccess(result.text));
      } catch (e) {
        emit(ChatFailure(e.toString()));
      }
    });
  }
}
