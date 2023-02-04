// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/core/widgets/favorite_button.dart';

import '../../../../core/cubits/favorites_cached/favorits_cubit.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../home_page/domain/entities/vacancy_entity.dart';

class SimpleSliverAppBar extends StatelessWidget {
  final VacancyEntity vacancy;
  final FavoriteVacancyCubit cubit;

  const SimpleSliverAppBar({
    Key? key,
    required this.vacancy,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: appMainColor,
      expandedHeight: SizeConfig(context, 60)(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FavoriteButton(
            vacancy: vacancy,
            cubit: cubit,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
