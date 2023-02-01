import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'custom_sized_box.dart';
import 'roboto_text.dart';
import 'size_config.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.white,
      expandedHeight: SizeConfig(context, 60)(),
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
            const CustomSizedBox(
              width: 5,
            ),
            RobotoText(localizationInstance.appTitle)
          ],
        ),
      ),
    );
  }
}
