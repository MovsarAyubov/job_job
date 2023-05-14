// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:poisk_raboty/core/widgets/roboto_text.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/detailed_vacancy.dart';

import 'custom_sized_box.dart';

class ResponseCard extends StatelessWidget {
  final DetailedVacancyEntity vacancy;
  const ResponseCard({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 16,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            const RobotoText(
              "fhlksdjf",
              fontSize: 16,
            ),
            const CustomSizedBox(height: 10),
            RobotoText(
              vacancy.company,
            ),
            const CustomSizedBox(height: 4),
            RobotoText(
              vacancy.address,
            ),
          ],
        ),
      ),
    );
  }
}
