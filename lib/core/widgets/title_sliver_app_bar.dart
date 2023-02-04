// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:poisk_raboty/core/widgets/roboto_text.dart';

import '../app_colors.dart';

class TitleAppBar extends StatelessWidget with PreferredSizeWidget {
  final double appBarHeight;
  final String title;
  const TitleAppBar({
    Key? key,
    this.appBarHeight = 0.0,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: RobotoText(
        title,
        fontSize: 18,
        color: Colors.white,
      )),
      backgroundColor: appMainColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
