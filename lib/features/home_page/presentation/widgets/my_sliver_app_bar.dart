import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';

import '../../../../core/widgets/size_config.dart';
import '../../../search_setting_page/presentation/pages/search_page.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: true,
      backgroundColor: appMainColor,
      expandedHeight: SizeConfig(context, 60)(),
      title: const Text(
        "JobJob",
        style: TextStyle(
          fontSize: 26,
          fontFamily: "Playfair",
        ),
      ),
      actions: [
        IconButton(
            iconSize: 34,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ));
            },
            icon: const Icon(Icons.manage_search_outlined))
      ],
    );
  }
}
