import '../../domain/entities/contacts_entity.dart';
import '../../domain/entities/detailed_vacancy.dart';

class DetailedVacancyModel extends DetailedVacancyEntity {
  const DetailedVacancyModel({
    required String title,
    required String price,
    required String workExperience,
    required String dayEmployment,
    required String vacancyViews,
    required String company,
    required String address,
    List<String> description = const [],
    List<ContactsEntity> contacts = const [],
  }) : super(
          title: title,
          price: price,
          workExperience: workExperience,
          dayEmployment: dayEmployment,
          vacancyViews: vacancyViews,
          company: company,
          address: address,
          description: description,
          contacts: contacts,
        );
}
