import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../providers/chat_bloc.dart';
import '../providers/chat_event.dart';
import '../providers/chat_state.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Gemini AI Chat')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    if (state is ChatLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ChatSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChatBubble(text: _controller.text, isUser: true),
                          const SizedBox(height: 12),
                          ChatBubble(text: state.response, isUser: false),
                        ],
                      );
                    } else if (state is ChatFailure) {
                      return Center(child: Text("Error: ${state.error}"));
                    } else {
                      return const Center(child: Text("Ask me anything..."));
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: "Type a message"),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      final message = _controller.text.trim();
                      if (message.isNotEmpty) {
                        context.read<ChatBloc>().add(SendMessageEvent(message));
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
