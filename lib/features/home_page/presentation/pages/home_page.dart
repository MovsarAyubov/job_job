import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart';

import '../../../../setup.dart';
import '../cubit/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<HomePageCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is HomeInitital) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is VacanciesLoadedState) {
              return ListView.builder(
                  itemCount: state.vacancies.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          state.vacancies[index].title,
                        ),
                        subtitle: Text(
                          state.vacancies[index].salary.toString(),
                        ),
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
