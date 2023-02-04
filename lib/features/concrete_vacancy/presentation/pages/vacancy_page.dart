// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/core/cubits/favorites_cached/favorits_cubit.dart';
import 'package:poisk_raboty/core/widgets/error_widget.dart';
import 'package:poisk_raboty/features/auth_page/presentation/cubit/account_in_system_cubit.dart';
import 'package:poisk_raboty/features/concrete_vacancy/presentation/widgets/simple_sliver_app_bar.dart';
import 'package:poisk_raboty/features/concrete_vacancy/presentation/widgets/vacancy.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../../../core/widgets/roboto_text.dart';
import '../../../../setup.dart';
import '../cubit/concrete_vacancy_cubit.dart';
import '../cubit/concrete_vacancy_state.dart';

class VacancyPage extends StatefulWidget {
  final VacancyEntity vacancy;
  const VacancyPage({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  final cubit = getIt<ConcreteVacancyCubit>();
  final favoritesCubit = getIt<FavoriteVacancyCubit>();
  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  @override
  void initState() {
    cubit.fetchConcreteVacancy(url: widget.vacancy.link);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ConcreteVacancyCubit, ConcreteVacancyState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is ConcreteVacancyLoadedState) {
          return CustomScrollView(slivers: [
            SimpleSliverAppBar(vacancy: widget.vacancy, cubit: favoritesCubit),
            Vacancy(
              concreteVacancy: state.concreteVacancy,
              cubit: accountInSystemCubit,
            )
          ]);
        } else if (state is ConcreteVacancyInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: appMainColor,
            ),
          );
        } else {
          return Center(child: InternetErrorWidget(callback: () async {
            await cubit.fetchConcreteVacancy(url: widget.vacancy.link);
          }));
        }
      },
    ));
  }
}
