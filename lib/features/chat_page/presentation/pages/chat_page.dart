// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/core/widgets/custom_sized_box.dart';
import 'package:poisk_raboty/core/widgets/roboto_text.dart';
import 'package:poisk_raboty/core/widgets/size_config.dart';
import 'package:poisk_raboty/core/widgets/title_sliver_app_bar.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/models/message_model.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';
import '../../../call_page/presentation/pages/call_page.dart';
import '../cubit/chat_page_cubit.dart';
import '../cubit/chat_page_state.dart';
import '../widgets/message_card.dart';
import '../widgets/text_field_with_button.dart';

class ChatPage extends StatefulWidget {
  final VacancyEntity vacancy;
  const ChatPage({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    );
  }

  final chatPageCubit = getIt<ChatPageCubit>();
  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
          appBarHeight: SizeConfig(context, 60)(), title: widget.vacancy.title),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<ChatPageCubit, ChatPageState>(
              bloc: chatPageCubit,
              builder: (context, state) {
                return ListView.separated(
                  padding: EdgeInsets.all(SizeConfig(context, 8)()),
                  shrinkWrap: true,
                  itemCount: chatPageCubit.sortMessages(widget.vacancy).length,
                  itemBuilder: (context, index) => MessageCard(
                      message:
                          chatPageCubit.sortMessages(widget.vacancy)[index]),
                  separatorBuilder: (context, index) =>
                      const CustomSizedBox(height: 4),
                );
              }),
          Column(
            children: [
              BlocBuilder<ChatPageCubit, ChatPageState>(
                  bloc: chatPageCubit,
                  builder: (context, state) {
                    return Row(
                      children: [
                        chatPageCubit.goOnInterview()
                            ? Expanded(
                                child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              appMainColor)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => CallPage(
                                          userName: accountInSystemCubit
                                              .state.accountInSystem.userName,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const RobotoText(
                                    "Начать интервью",
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                            : Expanded(
                                child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      appMainColor.withOpacity(0.6),
                                    ),
                                  ),
                                  child: const RobotoText(
                                    "Начать интервью",
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                      ],
                    );
                  }),
              TextFieldWithButton(
                cubit: chatPageCubit,
                vacancy: widget.vacancy,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
