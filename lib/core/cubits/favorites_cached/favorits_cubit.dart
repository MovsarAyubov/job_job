import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../features/home_page/domain/entities/vacancy_entity.dart';
import 'favorits_state.dart';

@LazySingleton()
class FavoriteVacancyCubit extends HydratedCubit<FavoriteVacancyState> {
  FavoriteVacancyCubit() : super(const FavoriteVacancyState());

  bool contains(VacancyEntity vacancy) {
    final index =
        state.favorites.indexWhere((element) => element.title == vacancy.title);
    return index >= 0;
  }

  void addToFavorites(VacancyEntity vacancy) {
    if (!contains(vacancy)) {
      final favorites = List<VacancyEntity>.from(state.favorites)..add(vacancy);
      emit(FavoriteVacancyState(favorites: favorites));
    }
  }

  void deleteFromFavorites(VacancyEntity vacancy) {
    final favorites = List<VacancyEntity>.from(state.favorites)
      ..removeWhere((element) => element.id == vacancy.id);
    emit(FavoriteVacancyState(favorites: favorites));
  }

  void addOrRemove(VacancyEntity vacancy) {
    if (!contains(vacancy)) {
      addToFavorites(vacancy);
    } else {
      deleteFromFavorites(vacancy);
    }
  }

  void cleanStore() {
    emit(const FavoriteVacancyState(favorites: []));
  }

  @override
  FavoriteVacancyState? fromJson(Map<String, dynamic> json) =>
      FavoriteVacancyState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(FavoriteVacancyState state) => state.toMap();
}
