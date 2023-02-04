// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/vacancy_card.dart';

class FavoriteVacancies extends StatelessWidget {
  final List<VacancyEntity> vacancies;
  const FavoriteVacancies({
    Key? key,
    required this.vacancies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      itemBuilder: (context, index) =>
          VacancyCard(isReviwed: false, vacancy: vacancies[index]),
      separatorBuilder: (context, index) => const CustomSizedBox(
        height: 10,
      ),
      itemCount: vacancies.length,
    );
  }
}
