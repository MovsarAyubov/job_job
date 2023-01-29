// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart';
import 'package:poisk_raboty/features/home_page/data/models/vacancy_model.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/exceptions/server_exeption.dart';

@LazySingleton(as: VacanciesSource)
class VacanciesSourceImpl extends VacanciesSource {
  final MainApi mainApi;
  const VacanciesSourceImpl(
    this.mainApi,
  );
  @override
  Future<List<VacancyModel>> fetchListOfVacancies() async {
    try {
      final response = await mainApi.client().fetchVacancies();
      return response;
    } catch (e) {
      if (e is DioError) {}
      throw ServerException();
    }
  }

  @override
  List<Object?> get props => [];
}
