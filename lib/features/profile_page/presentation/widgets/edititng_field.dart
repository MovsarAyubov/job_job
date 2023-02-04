// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/roboto_text.dart';

class EditingField extends StatelessWidget {
  final String header;
  final String title;
  final String helperTitle;
  const EditingField({
    Key? key,
    required this.header,
    required this.title,
    required this.helperTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RobotoText("$header ${title.trim().isEmpty ? helperTitle : title}"),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.edit,
            color: appMainColor,
          ),
        )
      ],
    );
  }
}
