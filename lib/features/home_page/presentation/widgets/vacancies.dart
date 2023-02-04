// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:poisk_raboty/core/widgets/vacancy_card.dart';

import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../l10n/l10n.dart';
import '../../../../setup.dart';
import '../cubit/home_page_state.dart';

class Vacancies extends StatefulWidget {
  final VacanciesLoadedState state;
  const Vacancies({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<Vacancies> createState() => _VacanciesState();
}

class _VacanciesState extends State<Vacancies> {
  final cubit = getIt<HomePageCubit>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSizedBox(
              height: 8,
            ),
            RobotoText(
              localizationInstance.vacanciesForYou,
              fontSize: 17,
            ),
            const CustomSizedBox(
              height: 5,
            ),
            ListView.separated(
                padding: const EdgeInsets.all(0),
                primary: false,
                shrinkWrap: true,
                itemCount: widget.state.vacancies.length,
                separatorBuilder: (context, index) => const CustomSizedBox(
                      height: 8,
                    ),
                itemBuilder: (context, index) => VacancyCard(
                      isReviwed: false,
                      vacancy: widget.state.vacancies[index],
                    )),
            cubit.isLastPage
                ? const SizedBox()
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: appMainColor,
                    )),
                  )
          ],
        ),
      ),
    );
  }
}
