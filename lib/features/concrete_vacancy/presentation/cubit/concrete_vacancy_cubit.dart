// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/usecases/fetch_detailed_vacancy.dart';

import 'concrete_vacancy_state.dart';

@injectable
class ConcreteVacancyCubit extends Cubit<ConcreteVacancyState> {
  final FetchDetailedVacancy useCase;
  ConcreteVacancyCubit({required this.useCase})
      : super(ConcreteVacancyInitial());

  Future<void> fetchConcreteVacancy({required String url}) async {
    emit(ConcreteVacancyInitial());
    final response = await useCase.call(url: url);
    response.fold((error) => emit(const ErrorState(errorMessage: "error")),
        (vacancy) {
      emit(ConcreteVacancyLoadedState(concreteVacancy: vacancy));
    });
  }
}
