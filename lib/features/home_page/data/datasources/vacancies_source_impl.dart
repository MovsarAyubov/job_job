// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/core/api/main_api.dart';
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart';
import 'package:poisk_raboty/features/home_page/data/models/vacancy_model.dart';
import 'package:poisk_raboty/l10n/l10n.dart';

import '../../../../core/api/urls.dart';
import '../../../../core/exceptions/server_exeption.dart';

@LazySingleton(as: VacanciesSource)
class VacanciesSourceImpl extends VacanciesSource {
  final MainApi mainApi;
  const VacanciesSourceImpl(
    this.mainApi,
  );

  @override
  Future<List<VacancyModel>> fetchListOfVacancies(
      {required num page,
      required double salary,
      required int area,
      required String job}) async {
    final response = await mainApi.client.get(Uri.parse(
        '${Urls.baseUrl}${Urls.vacancies}?&area=$area&salary=${salary.round()}&only_with_salary=true&text=$job&page=$page'));
    final bs = BeautifulSoup(response.body);
    try {
      final vacancyCards = bs.findAll(
        'div',
        class_: 'vacancy-serp-item__layout',
      );

      final vacancies = vacancyCards.map(
        (item) {
          final title = item.find('a',
              class_: 'serp-item__title', selector: 'h3 > span > a');
          final values = title?.attributes.values.toList();
          return VacancyModel(
            link: values?.last ?? localizationInstance.lackOfInformation,
            id: item.hashCode,
            title: title?.text ?? localizationInstance.lackOfInformation,
            salary: item.find('span', class_: 'bloko-header-section-3')?.text ??
                localizationInstance.lackOfInformation,
            company: item
                    .find('a',
                        class_: 'bloko-link bloko-link_kind-tertiary',
                        selector:
                            'div > div.vacancy-serp-item__meta-info-company > a')
                    ?.text ??
                localizationInstance.lackOfInformation,
            address: item
                    .find('div',
                        class_: 'bloko-text',
                        selector:
                            'div.vacancy-serp-item__info > div.bloko-text')
                    ?.text ??
                localizationInstance.lackOfInformation,
            description: item
                    .find('div',
                        class_: 'g-user-content',
                        selector: 'div.g-user-content')
                    ?.text ??
                localizationInstance.lackOfInformation,
          );
        },
      ).toList();
      return vacancies;
    } catch (e) {
      if (e is DioError) {}
      throw ServerException();
    }
  }

  @override
  List<Object?> get props => [];
}
