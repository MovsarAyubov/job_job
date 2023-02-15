// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

import '../../domain/usecases/fetch_vacancies.dart';
import 'home_page_state.dart';

@LazySingleton()
class HomePageCubit extends Cubit<HomePageState> {
  final FetchVacancies useCase;
  HomePageCubit(
    this.useCase,
  ) : super(HomeInitital());

  bool get isLastPage => _isLastPage;
  int get page => _page;

  int _page = 0;
  final int _limit = 20;
  bool _isLastPage = false;
  bool _isLoading = false;
  List<VacancyEntity> oldVacancies = [];

  Future<void> fetchVacancies(
      {int page = 0,
      double salary = 0,
      int area = 113,
      String job = ""}) async {
    if (_page == 0) {
      emit(HomeInitital());
    }
    if (!_isLastPage && !_isLoading) {
      _isLoading = true;
      final response =
          await useCase.call(page: _page, job: job, area: area, salary: salary);
      response.fold((error) => emit(const ErrorState(errorMessage: "error")),
          (vacancies) {
        emit(VacanciesLoadedState(
            vacancies: List<VacancyEntity>.from(oldVacancies)
              ..addAll(vacancies)));
        oldVacancies.addAll(vacancies);
        _isLastPage = vacancies.length < _limit;
      });
      _page++;
      _isLoading = false;
    }
  }

  void deletePreviousDataAndDownloadNewOnes(
      {double salary = 0, int area = 1, String job = ""}) async {
    emit(const VacanciesLoadedState(vacancies: []));
    oldVacancies = [];
    _page = 0;
    _isLastPage = false;
    _isLoading = false;
    await fetchVacancies(page: page, job: job, salary: salary, area: area);
  }
}
