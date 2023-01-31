// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/app_colors.dart';

import 'package:poisk_raboty/core/widgets/custom_sized_box.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/widgets/roboto_text.dart';

class VacancyCard extends StatelessWidget {
  final bool isReviwed;
  final VacancyEntity vacancy;
  const VacancyCard({
    Key? key,
    required this.isReviwed,
    required this.vacancy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isReviwed ? greyText : blackText;
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RobotoText(
                    vacancy.title,
                    color: textColor,
                    fontSize: 16,
                    overflow: TextOverflow.clip,
                  ),
                ),
                CustomSizedBox(
                  height: 33,
                  width: 33,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
            RobotoText(
              vacancy.salary,
              color: textColor,
              fontSize: 16,
            ),
            const CustomSizedBox(height: 10),
            RobotoText(vacancy.company, color: textColor),
            const CustomSizedBox(height: 4),
            RobotoText(vacancy.address, color: textColor),
            const CustomSizedBox(height: 15),
            RobotoText(vacancy.description, color: textColor),
          ],
        ),
      ),
    );
  }
}
