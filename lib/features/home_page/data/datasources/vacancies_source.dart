import 'package:equatable/equatable.dart';
import 'package:poisk_raboty/features/home_page/data/models/vacancy_model.dart';

abstract class VacanciesSource extends Equatable {
  const VacanciesSource();
  Future<List<VacancyModel>> fetchListOfVacancies();
}
