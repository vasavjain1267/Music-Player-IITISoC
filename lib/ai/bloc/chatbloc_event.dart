// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chatbloc_bloc.dart';

@immutable
sealed class ChatblocEvent {}

class ChatGenerateNewTextMessageEvent extends ChatblocEvent {
  final String inputMessage;
   ChatGenerateNewTextMessageEvent({
    required this.inputMessage,
  });
  
}
