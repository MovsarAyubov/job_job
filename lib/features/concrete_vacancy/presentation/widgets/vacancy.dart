// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/core/models/message_model.dart';
import 'package:poisk_raboty/features/auth_page/presentation/cubit/account_in_system_cubit.dart';
import 'package:poisk_raboty/features/auth_page/presentation/pages/auth_page.dart';
import 'package:poisk_raboty/features/chat_page/presentation/cubit/chat_page_cubit.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/detailed_vacancy.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../setup.dart';
import '../../../response_page/presentation/cubit/responses_cubit.dart';
import '../../../response_page/presentation/cubit/responses_state.dart';

class Vacancy extends StatefulWidget {
  final VacancyEntity vacancy;
  final AccountInSystemCubit cubit;
  final ResponsesCubit responsesCubit;
  final DetailedVacancyEntity concreteVacancy;
  const Vacancy({
    Key? key,
    required this.vacancy,
    required this.cubit,
    required this.responsesCubit,
    required this.concreteVacancy,
  }) : super(key: key);

  @override
  State<Vacancy> createState() => _VacancyState();
}

class _VacancyState extends State<Vacancy> {
  final messagesCubit = getIt<ChatPageCubit>();

  var text =
      "Здравствуйте! Мы внимательно ознакомились с вашим резюмеи и хотим назначить собеседования, чтобы продолжить наше знакомство. Если вы согласны будем ждать вас сегодня в ${DateTime.now().hour}:${DateTime.now().minute + 1}. До встречи!";

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RobotoText(
                        widget.concreteVacancy.title,
                        fontSize: 18,
                      ),
                      const CustomSizedBox(
                        height: 5,
                      ),
                      RobotoText(
                        widget.concreteVacancy.price,
                        fontSize: 16,
                      ),
                      const CustomSizedBox(
                        height: 10,
                      ),
                      RobotoText(
                        widget.concreteVacancy.workExperience,
                      ),
                      RobotoText(
                        widget.concreteVacancy.dayEmployment,
                      ),
                      const CustomSizedBox(
                        height: 10,
                      ),
                      RobotoText(widget.concreteVacancy.company),
                      const CustomSizedBox(height: 5),
                      RobotoText(widget.concreteVacancy.address),
                      const CustomSizedBox(height: 10),
                      BlocBuilder<ResponsesCubit, ResponsesState>(
                          bloc: widget.responsesCubit,
                          builder: (context, state) {
                            if (widget.responsesCubit
                                .contains(widget.vacancy)) {
                              return ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              appMainColor.withOpacity(0.6))),
                                  child: RobotoText(
                                    localizationInstance.resumeSended,
                                    color: Colors.white,
                                  ));
                            } else {
                              return ElevatedButton(
                                  onPressed: () {
                                    widget.cubit.state.logged
                                        ? {
                                            widget.responsesCubit
                                                .addToResponses(widget.vacancy),
                                            Future.delayed(
                                                    const Duration(seconds: 20))
                                                .then(
                                              (value) => messagesCubit
                                                  .sendMessage(Message(
                                                      vacancy: widget.vacancy,
                                                      text: text,
                                                      sender: Sender.other)),
                                            )
                                          }
                                        : Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const AuthPage(),
                                          ));
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              appMainColor)),
                                  child: RobotoText(
                                    localizationInstance.response,
                                    color: Colors.white,
                                  ));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.concreteVacancy.description.length,
              separatorBuilder: (context, index) =>
                  const CustomSizedBox(height: 6),
              itemBuilder: (context, index) {
                return RobotoText(widget.concreteVacancy.description[index]);
              },
            ),
            const CustomSizedBox(height: 6),
            RobotoText(localizationInstance.contacts, fontSize: 18),
            RobotoText(widget.concreteVacancy.contacts[0].name),
            const CustomSizedBox(height: 2),
            RobotoText(widget.concreteVacancy.contacts[0].phoneNumber),
            const CustomSizedBox(height: 2),
            RobotoText(widget.concreteVacancy.contacts[0].email),
          ],
        ),
      ),
    );
  }
}
