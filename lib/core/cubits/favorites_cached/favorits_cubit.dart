import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/core/cubits/favorites_cached/favorits_state.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

@LazySingleton()
class FavoriteVacancyCubit extends HydratedCubit<FavoriteVacancyState> {
  FavoriteVacancyCubit() : super(const FavoriteVacancyState());

  bool contains(int id) {
    final index = state.favorites.indexWhere((element) => element.id == id);
    return index >= 0;
  }

  void addToFavorites(VacancyEntity vacancy) {
    if (!contains(vacancy.id)) {
      final favorites = List<VacancyEntity>.from(state.favorites)..add(vacancy);
      emit(FavoriteVacancyState(favorites: favorites));
    }
  }

  void deleteFromFavorites(int id) {
    final favorites = List<VacancyEntity>.from(state.favorites)
      ..removeWhere((element) => element.id == id);
    emit(FavoriteVacancyState(favorites: favorites));
  }

  void addOrRemove(VacancyEntity vacancy) {
    if (!contains(vacancy.id)) {
      addToFavorites(vacancy);
    } else {
      deleteFromFavorites(vacancy.id);
    }
  }

  @override
  FavoriteVacancyState? fromJson(Map<String, dynamic> json) =>
      FavoriteVacancyState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(FavoriteVacancyState state) => state.toMap();
}
