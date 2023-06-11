// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:poisk_raboty/l10n/l10n.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../chat_page/presentation/pages/chat_page.dart';
import '../../../home_page/domain/entities/vacancy_entity.dart';

class ResponseCard extends StatelessWidget {
  final VacancyEntity vacancy;
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
            RobotoText(
              vacancy.salary,
              fontSize: 16,
            ),
            const CustomSizedBox(height: 10),
            RobotoText(vacancy.company),
            const CustomSizedBox(height: 4),
            RobotoText(vacancy.address),
            const CustomSizedBox(height: 4),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(appMainColor)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          vacancy: vacancy,
                        ),
                      ),
                    );
                  },
                  child: RobotoText(
                    localizationInstance.goToChat,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
