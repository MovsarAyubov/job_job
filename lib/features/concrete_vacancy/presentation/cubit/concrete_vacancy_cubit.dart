import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'concrete_vacancy_state.dart';

class ConcreteVacancyCubit extends Cubit<ConcreteVacancyState> {
  ConcreteVacancyCubit() : super(ConcreteVacancyInitial());
}
