import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/my_sliver_app_bar.dart';
import '../../../../setup.dart';
import '../cubit/home_page_cubit.dart';
import '../cubit/home_page_state.dart';
import '../widgets/vacancies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<HomePageCubit>();

  final _scrollController = ScrollController();

  @override
  void initState() {
    cubit.fetchVacancies();

    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        cubit.fetchVacancies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is HomeInitital) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is VacanciesLoadedState) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const MySliverAppBar(),
                  Vacancies(state: state),
                ],
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          }),
    );
  }
}
