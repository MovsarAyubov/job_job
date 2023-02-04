// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:poisk_raboty/core/widgets/custom_sized_box.dart';
import 'package:poisk_raboty/core/widgets/roboto_text.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../../../auth_page/domain/entities/account_entity.dart';
import 'edititng_field.dart';

class PersonCard extends StatelessWidget {
  final Account account;
  const PersonCard({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RobotoText(
                    "${localizationInstance.userName}: ${account.userName}"),
                const CustomSizedBox(
                  height: 5,
                ),
                EditingField(
                  header: localizationInstance.email,
                  title: account.email,
                  helperTitle: localizationInstance.addEmail,
                ),
                const CustomSizedBox(
                  height: 5,
                ),
                EditingField(
                  header: localizationInstance.phoneNumber,
                  title: account.phoneNumber,
                  helperTitle: localizationInstance.addPhoneNumber,
                ),
              ],
            )),
      ),
    );
  }
}
