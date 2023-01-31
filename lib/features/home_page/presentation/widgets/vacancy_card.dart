// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/widgets/custom_sized_box.dart';

import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/widgets/roboto_text.dart';

class VacancyCard extends StatelessWidget {
  final VacancyEntity vacancy;
  const VacancyCard({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RobotoText(
              vacancy.title,
              fontSize: 16,
            ),
            RobotoText(
              vacancy.salary,
              fontSize: 16,
            ),
            const CustomSizedBox(height: 10),
            RobotoText(vacancy.company),
            const CustomSizedBox(height: 4),
            RobotoText(vacancy.address),
            const CustomSizedBox(height: 15),
            RobotoText(vacancy.description),
          ],
        ),
      ),
    );
  }
}
