import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'responses_state.dart';

import '../../../home_page/domain/entities/vacancy_entity.dart';

@LazySingleton()
class ResponsesCubit extends HydratedCubit<ResponsesState> {
  ResponsesCubit() : super(const ResponsesState());

  bool contains(VacancyEntity vacancy) {
    final index =
        state.responses.indexWhere((element) => element.title == vacancy.title);
    return index >= 0;
  }

  void addToResponses(VacancyEntity vacancy) {
    if (!contains(vacancy)) {
      final responses = List<VacancyEntity>.from(state.responses)..add(vacancy);
      emit(ResponsesState(responses: responses));
    }
  }

  void deleteFromResponses(VacancyEntity vacancy) {
    final responses = List<VacancyEntity>.from(state.responses)
      ..removeWhere((element) => element.id == vacancy.id);
    emit(ResponsesState(responses: responses));
  }

  void addOrRemove(VacancyEntity vacancy) {
    if (!contains(vacancy)) {
      addToResponses(vacancy);
    } else {
      deleteFromResponses(vacancy);
    }
  }

  void cleanStore() {
    emit(const ResponsesState(responses: []));
  }

  @override
  ResponsesState? fromJson(Map<String, dynamic> json) =>
      ResponsesState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ResponsesState state) => state.toMap();
}
