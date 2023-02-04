// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

class FavoriteVacancyState extends Equatable {
  final List<VacancyEntity> favorites;
  const FavoriteVacancyState({
    this.favorites = const [],
  });
  @override
  List<Object> get props => [favorites];

  FavoriteVacancyState copyWith({
    List<VacancyEntity>? favorites,
  }) {
    return FavoriteVacancyState(
      favorites: favorites ?? this.favorites,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'favorites': favorites.map((e) => e.toMap()).toList()});
    return result;
  }

  factory FavoriteVacancyState.fromMap(Map<String, dynamic> map) {
    return FavoriteVacancyState(
      favorites: List<VacancyEntity>.from(
          map['favorites']?.map((x) => VacancyEntity.fromMap(x))),
    );
  }

  @override
  bool get stringify => true;
}
