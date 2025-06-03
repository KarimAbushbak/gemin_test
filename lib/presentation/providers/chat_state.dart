abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final String response;
  ChatSuccess(this.response);
}

class ChatFailure extends ChatState {
  final String error;
  ChatFailure(this.error);
}
