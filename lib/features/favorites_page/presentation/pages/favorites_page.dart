import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/favorites_cached/favorits_cubit.dart';
import '../../../../core/cubits/favorites_cached/favorits_state.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../core/widgets/title_sliver_app_bar.dart';
import '../../../../l10n/l10n.dart';
import '../../../../setup.dart';
import '../widgets/favorite_vacancies.dart';
import '../widgets/no_favorite_vacancy.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final cubit = getIt<FavoriteVacancyCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
          appBarHeight: SizeConfig(context, 60)(),
          title: localizationInstance.favorites),
      body: BlocBuilder<FavoriteVacancyCubit, FavoriteVacancyState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.favorites.isNotEmpty) {
            return FavoriteVacancies(vacancies: state.favorites);
          } else {
            return const NoFavoriteVacancy();
          }
        },
      ),
    );
  }
}
