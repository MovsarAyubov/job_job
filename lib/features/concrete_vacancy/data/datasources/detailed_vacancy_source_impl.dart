// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/core/api/main_api.dart';
import 'package:poisk_raboty/features/concrete_vacancy/data/datasources/detailed_vacancy_source.dart';
import 'package:poisk_raboty/features/concrete_vacancy/data/models/detailed_vacancy_model.dart';

import '../../../../core/exceptions/server_exeption.dart';
import '../../../../l10n/l10n.dart';
import '../../domain/entities/contacts_entity.dart';

@LazySingleton(as: ConcreteVacancySource)
class ConcreteVacancySourceImpl implements ConcreteVacancySource {
  final MainApi mainApi;
  const ConcreteVacancySourceImpl(
    this.mainApi,
  );

  List<String> getDescription(List<Bs4Element> list) {
    final desc = <String>[];
    for (var item in list) {
      desc.add(item.text);
    }
    return desc;
  }

  @override
  Future<DetailedVacancyModel> fetchConcreteVacancy(
      {required String url}) async {
    try {
      final response = await mainApi.client.get(Uri.parse(url));
      final bs = BeautifulSoup(response.body);
      final vacancy = bs.find('div',
          class_:
              'bloko-column bloko-column_container bloko-column_xs-4 bloko-column_s-8 bloko-column_m-12 bloko-column_l-10');
      final userContent =
          vacancy?.find('div', class_: 'g-user-content')?.children ?? [];

      return DetailedVacancyModel(
          address: vacancy
                  ?.find(
                    'a',
                    class_:
                        'bloko-link bloko-link_kind-tertiary bloko-link_disable-visited',
                  )
                  ?.text ??
              vacancy?.find('p', class_: 'vacancy-view-location')?.text ??
              localizationInstance.lackOfInformation,
          title: vacancy
                  ?.find('h1',
                      class_: 'bloko-header-section-1',
                      selector: 'div > div.vacancy-title > h1')
                  ?.text ??
              localizationInstance.lackOfInformation,
          price: vacancy
                  ?.find(
                    'span',
                    class_:
                        'bloko-header-section-2 bloko-header-section-2_lite',
                  )
                  ?.text ??
              localizationInstance.lackOfInformation,
          workExperience: vacancy
                  ?.find(
                    'p',
                    class_: 'vacancy-description-list-item',
                  )
                  ?.text ??
              localizationInstance.lackOfInformation,
          dayEmployment: vacancy
                  ?.find('p',
                      class_: 'vacancy-description-list-item',
                      selector: 'div > p:nth-child(3)')
                  ?.text ??
              localizationInstance.lackOfInformation,
          vacancyViews: '',
          company:
              vacancy?.find('span', class_: 'vacancy-company-name')?.text ??
                  localizationInstance.lackOfInformation,
          description: getDescription(userContent),
          contacts: Contacts.getContacts());
    } catch (e) {
      if (e is DioError) {}
      throw ServerException();
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}

class Contacts {
  static List<ContactsEntity> getContacts() {
    return [
      const ContactsEntity(
          email: "ivan_ivanov@mail.ru",
          phoneNumber: "+7(989)-87-56",
          name: "Иван Иванов"),
      const ContactsEntity(
          email: 'sergey12@mail.ru',
          phoneNumber: "+7(989)-87-56",
          name: 'Сергей Романов'),
      const ContactsEntity(
          email: 'dmitriy@mail.ru',
          phoneNumber: "+7(989)-87-56",
          name: 'Дмитрий Романов'),
      const ContactsEntity(
          email: 'kuznezova@mail.ru',
          phoneNumber: "+7(989)-87-56",
          name: 'Людмила Кузнецова'),
      const ContactsEntity(
          email: 'georgiy111@mail.ru',
          phoneNumber: "+7(989)-87-56",
          name: 'Георгий Шайгу'),
      const ContactsEntity(
          email: 'genadiy00@mail.ru',
          phoneNumber: "+7(989)-87-56",
          name: 'Генадий Волков'),
    ];
  }
}
