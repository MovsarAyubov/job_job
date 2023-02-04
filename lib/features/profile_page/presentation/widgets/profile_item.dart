import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/roboto_text.dart';

class ProfileItem extends StatelessWidget {
  final Color textColor;
  final VoidCallback callback;
  final String title;
  const ProfileItem({
    Key? key,
    this.textColor = blackText,
    required this.callback,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RobotoText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
