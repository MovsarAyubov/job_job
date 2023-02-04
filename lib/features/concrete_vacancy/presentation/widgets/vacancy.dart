// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/features/auth_page/presentation/cubit/account_in_system_cubit.dart';
import 'package:poisk_raboty/features/auth_page/presentation/pages/auth_page.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/detailed_vacancy.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';

class Vacancy extends StatelessWidget {
  final AccountInSystemCubit cubit;
  final DetailedVacancyEntity concreteVacancy;
  const Vacancy({
    Key? key,
    required this.cubit,
    required this.concreteVacancy,
  }) : super(key: key);

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
                        concreteVacancy.title,
                        fontSize: 18,
                      ),
                      const CustomSizedBox(
                        height: 5,
                      ),
                      RobotoText(
                        concreteVacancy.price,
                        fontSize: 16,
                      ),
                      const CustomSizedBox(
                        height: 10,
                      ),
                      RobotoText(
                        concreteVacancy.workExperience,
                      ),
                      RobotoText(
                        concreteVacancy.dayEmployment,
                      ),
                      const CustomSizedBox(
                        height: 10,
                      ),
                      RobotoText(concreteVacancy.company),
                      const CustomSizedBox(height: 5),
                      RobotoText(concreteVacancy.address),
                      const CustomSizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                cubit.state.logged
                                    ? () {}
                                    : Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) => const AuthPage(),
                                      ));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(appMainColor)),
                              child: RobotoText(
                                localizationInstance.response,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: concreteVacancy.description.length,
              separatorBuilder: (context, index) =>
                  const CustomSizedBox(height: 6),
              itemBuilder: (context, index) {
                return RobotoText(concreteVacancy.description[index]);
              },
            ),
            const CustomSizedBox(height: 6),
            RobotoText(localizationInstance.contacts, fontSize: 18),
            RobotoText(concreteVacancy.contacts[0].name),
            const CustomSizedBox(height: 2),
            RobotoText(concreteVacancy.contacts[0].phoneNumber),
            const CustomSizedBox(height: 2),
            RobotoText(concreteVacancy.contacts[0].email),
          ],
        ),
      ),
    );
  }
}
