// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:poisk_raboty/core/api/main_api.dart';
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart';
import 'package:poisk_raboty/features/home_page/data/models/vacancy_model.dart';

import '../../../../core/api/urls.dart';
import '../../../../core/exceptions/server_exeption.dart';

@LazySingleton(as: VacanciesSource)
class VacanciesSourceImpl extends VacanciesSource {
  final MainApi mainApi;
  const VacanciesSourceImpl(
    this.mainApi,
  );
  @override
  Future<List<VacancyModel>> fetchListOfVacancies() async {
    final response = await mainApi.client.get(Uri.parse(
        '${Urls.baseUrl}${Urls.vacancies}?area=1&search_field=name&search_field=company_name&search_field=description&text=&customDomain=1&page=2'));
    final bs = BeautifulSoup(response.body);
    try {
      final vacancyCards = bs.findAll(
        'div',
        class_: 'vacancy-serp-item__layout',
      );

      final vacancies = vacancyCards.map((item) {
        return VacancyModel(
          title: item.find('a', class_: 'serp-item__title')?.text ?? '',
          salary:
              item.find('span', class_: 'bloko-header-section-3')?.text ?? '',
          company: item
                  .find('a',
                      class_: 'bloko-link bloko-link_kind-tertiary',
                      selector:
                          'div > div.vacancy-serp-item__meta-info-company > a')
                  ?.text ??
              '',
          address: item
                  .find('div',
                      class_: 'bloko-text',
                      selector: 'div.vacancy-serp-item__info > div.bloko-text')
                  ?.text ??
              '',
          description: item
                  .find('div',
                      class_: 'g-user-content', selector: 'div.g-user-content')
                  ?.text ??
              '',
        );
      }).toList();

      return vacancies;
    } catch (e) {
      if (e is DioError) {}
      throw ServerException();
    }
  }

  @override
  List<Object?> get props => [];
}
