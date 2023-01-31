import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/core/widgets/custom_sized_box.dart';
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart';

import '../../../../setup.dart';
import '../cubit/home_page_state.dart';
import '../widgets/vacancy_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<HomePageCubit>();

  @override
  void initState() {
    cubit.fetchVacancies();
    super.initState();
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
              return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  itemCount: state.vacancies.length,
                  separatorBuilder: (context, index) => const CustomSizedBox(
                        height: 8,
                      ),
                  itemBuilder: (context, index) => VacancyCard(
                        vacancy: state.vacancies[index],
                      ));
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          }),
    );
  }
}
