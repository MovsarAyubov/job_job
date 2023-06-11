// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:poisk_raboty/features/chat_page/presentation/cubit/chat_page_cubit.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/models/message_model.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/size_config.dart';

class TextFieldWithButton extends StatefulWidget {
  final VacancyEntity vacancy;
  final ChatPageCubit cubit;
  const TextFieldWithButton({
    Key? key,
    required this.vacancy,
    required this.cubit,
  }) : super(key: key);

  @override
  State<TextFieldWithButton> createState() => _TextFieldWithButtonState();
}

class _TextFieldWithButtonState extends State<TextFieldWithButton> {
  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    );
  }

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: border(),
                  enabledBorder: border(),
                ),
              ),
            ),
          ),
          const CustomSizedBox(width: 4),
          InkWell(
            onTap: () {
              widget.cubit.sendMessage(Message(
                  vacancy: widget.vacancy,
                  text: controller.text,
                  sender: Sender.me));
              controller.clear();
              FocusScope.of(context).unfocus();
            },
            child: CircleAvatar(
              radius: SizeConfig(context, 20)(),
              backgroundColor: appMainColor,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
