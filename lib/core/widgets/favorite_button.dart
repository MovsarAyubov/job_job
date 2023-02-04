// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../cubits/favorites_cached/favorits_cubit.dart';
import '../cubits/favorites_cached/favorits_state.dart';

class FavoriteButton extends StatelessWidget {
  final Color color;
  final VacancyEntity vacancy;
  final FavoriteVacancyCubit cubit;
  const FavoriteButton({
    Key? key,
    required this.color,
    required this.vacancy,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cubit.addOrRemove(vacancy);
      },
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: BlocBuilder<FavoriteVacancyCubit, FavoriteVacancyState>(
          bloc: cubit,
          builder: (context, state) {
            return Icon(
              cubit.contains(vacancy)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: cubit.contains(vacancy) ? Colors.red : color,
              size: 28,
            );
          }),
    );
  }
}
