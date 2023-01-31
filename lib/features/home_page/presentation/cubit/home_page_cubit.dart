// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../domain/usecases/fetch_vacancies.dart';
import 'home_page_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final FetchVacancies useCase;
  HomePageCubit(
    this.useCase,
  ) : super(HomeInitital());

  int page = 0;

  List<VacancyEntity> oldVacancies = [];

  void fetchVacancies() async {
    final response = await useCase.call();
    response.fold((error) => emit(const ErrorState(errorMessage: "error")),
        (vacancies) {
      emit(VacanciesLoadedState(
          vacancies: List<VacancyEntity>.from(oldVacancies)
            ..addAll(vacancies)));
      oldVacancies.addAll(vacancies);
    });
  }
}
