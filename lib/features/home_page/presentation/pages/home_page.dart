import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/app_colors.dart';
import 'package:poisk_raboty/core/widgets/error_widget.dart';
import 'package:poisk_raboty/core/widgets/roboto_text.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../widgets/my_sliver_app_bar.dart';
import '../../../../setup.dart';
import '../cubit/home_page_cubit.dart';
import '../cubit/home_page_state.dart';
import '../widgets/vacancies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final cubit = getIt<HomePageCubit>();

  final _scrollController = ScrollController();

  @override
  void initState() {
    cubit.fetchVacancies(page: cubit.page, job: '');

    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        cubit.fetchVacancies(page: cubit.page, job: '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is HomeInitital) {
              return const Center(
                child: CircularProgressIndicator(
                  color: appMainColor,
                ),
              );
            } else if (state is VacanciesLoadedState) {
              if (state.vacancies.isEmpty) {
                return Center(
                    child: RobotoText(localizationInstance.vacanciesNotFound));
              } else {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    const MySliverAppBar(),
                    Vacancies(state: state),
                  ],
                );
              }
            } else {
              return Center(
                child: InternetErrorWidget(callback: () async {
                  await cubit.fetchVacancies(page: cubit.page);
                }),
              );
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
