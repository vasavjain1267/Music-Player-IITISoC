// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chatbloc_bloc.dart';

@immutable
sealed class ChatblocState {}

final class ChatblocInitial extends ChatblocState {}

class ChatSuccessState extends ChatblocState {
  final List<Chatmessage> messages;
   ChatSuccessState({
    required this.messages,
  });
} 
