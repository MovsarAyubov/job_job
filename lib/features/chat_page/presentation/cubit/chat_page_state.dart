// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../core/models/message_model.dart';

class ChatPageState extends Equatable {
  final List<Message> messages;
  const ChatPageState({
    this.messages = const [],
  });

  @override
  List<Object> get props => [messages];
}
