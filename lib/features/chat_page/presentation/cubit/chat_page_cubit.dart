import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/models/message_model.dart';
import 'chat_page_state.dart';

@LazySingleton()
class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(const ChatPageState());

  void sendMessage(Message message) {
    final messages = List<Message>.from(state.messages)..add(message);
    emit(ChatPageState(messages: messages));
  }

  List<Message> sortMessages(VacancyEntity vacancy) {
    List<Message> messages = [];
    for (var message in state.messages) {
      if (message.vacancy == vacancy) {
        messages.add(message);
      }
    }
    return messages;
  }

  bool goOnInterview() {
    for (var message in state.messages) {
      if (message.sender == Sender.other) {
        return true;
      }
    }
    return false;
  }
}
