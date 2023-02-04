import 'package:flutter/material.dart';
import 'package:poisk_raboty/core/app_colors.dart';

import '../../../../l10n/l10n.dart';
import '../../../../core/widgets/custom_sized_box.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../core/widgets/size_config.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: appMainColor,
      expandedHeight: SizeConfig(context, 60)(),
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
            const CustomSizedBox(width: 5),
            RobotoText(
              localizationInstance.appTitle,
              color: Colors.white,
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
