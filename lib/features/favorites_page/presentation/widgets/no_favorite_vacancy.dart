import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/widgets/roboto_text.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../l10n/l10n.dart';

class NoFavoriteVacancy extends StatelessWidget {
  const NoFavoriteVacancy({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RobotoText(
        localizationInstance.noFavorites,
        fontSize: 18,
      ),
    );
  }
}
