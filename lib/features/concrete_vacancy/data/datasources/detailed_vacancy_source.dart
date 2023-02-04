import 'package:equatable/equatable.dart';
import '../models/detailed_vacancy_model.dart';

abstract class ConcreteVacancySource extends Equatable {
  const ConcreteVacancySource();
  Future<DetailedVacancyModel> fetchConcreteVacancy({required String url});
}
