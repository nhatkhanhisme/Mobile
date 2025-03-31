class ChatbotEvent {}

class ChatbotEventStarted extends ChatbotEvent {}

class ChatbotEventAsking extends ChatbotEvent {
  final String prompt;

  ChatbotEventAsking({required this.prompt});
}
