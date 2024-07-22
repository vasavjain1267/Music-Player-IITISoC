import 'dart:async';

//import 'package:ask_me/models/chatmessage.dart';
//import 'package:ask_me/repos/chat_repos.dart';
import 'package:bloc/bloc.dart';
import 'package:harmonix/ai/models/chatmessage.dart';
import 'package:harmonix/ai/repos/chat_repos.dart';
import 'package:meta/meta.dart';

part 'chatbloc_event.dart';
part 'chatbloc_state.dart';

class ChatblocBloc extends Bloc<ChatblocEvent, ChatblocState> {
  ChatblocBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<Chatmessage> messages = [];
  bool generating = false;
  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event,
      Emitter<ChatblocState> emit) async {
    messages.add(Chatmessage(
        role: "user", parts: [Chatpartmodel(text: event.inputMessage)]));
    emit(ChatSuccessState(messages: messages));
    generating = true;
    String generatedtext = await Myrepo.chatTextGenerationRepo(messages);
    if (generatedtext.length > 0) {
      messages.add(Chatmessage(
          role: 'model', parts: [Chatpartmodel(text: generatedtext)]));
      emit(ChatSuccessState(messages: messages));
    }
    generating = false;
  }
}
