// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

class ResponsesState extends Equatable {
  final List<VacancyEntity> responses;
  const ResponsesState({
    this.responses = const [],
  });
  @override
  List<Object> get props => [responses];

  ResponsesState copyWith({
    List<VacancyEntity>? responses,
  }) {
    return ResponsesState(
      responses: responses ?? this.responses,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'responses': responses.map((e) => e.toMap()).toList()});
    return result;
  }

  factory ResponsesState.fromMap(Map<String, dynamic> map) {
    return ResponsesState(
      responses: List<VacancyEntity>.from(
          map['responses']?.map((x) => VacancyEntity.fromMap(x))),
    );
  }

  @override
  bool get stringify => true;
}
