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

  bool get isLastPage => _isLastPage;

  int _page = 0;
  final int _limit = 20;
  bool _isLastPage = false;
  bool _isLoading = false;
  List<VacancyEntity> oldVacancies = [];

  Future<void> fetchVacancies() async {
    if (_page == 0) {
      emit(HomeInitital());
    }
    if (!_isLastPage && !_isLoading) {
      _isLoading = true;
      final response = await useCase.call(page: _page);
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
}
