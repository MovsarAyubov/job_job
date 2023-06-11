// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/widgets/roboto_text.dart';
import 'package:poisk_raboty/core/widgets/size_config.dart';

import '../../../../core/models/message_model.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: message.sender == Sender.me
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig(context, 200)(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.withOpacity(0.5),
          ),
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig(context, 2)(),
              horizontal: SizeConfig(context, 8)()),
          alignment: message.sender == Sender.me
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: RobotoText(
            message.text,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
