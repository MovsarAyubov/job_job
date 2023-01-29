import 'package:dio/dio.dart';
import 'package:poisk_raboty/core/api/urls.dart';
import 'package:poisk_raboty/features/home_page/data/models/vacancy_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Urls.vacancies)
  Future<List<VacancyModel>> fetchVacancies();
}
