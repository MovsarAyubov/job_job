// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/contacts_entity.dart';

class DetailedVacancyEntity extends Equatable {
  final String title;
  final String price;
  final String workExperience;
  final String dayEmployment;
  final String vacancyViews;
  final String company;
  final String address;
  final List<String> description;
  final List<ContactsEntity> contacts;
  const DetailedVacancyEntity({
    required this.title,
    required this.price,
    required this.workExperience,
    required this.dayEmployment,
    required this.vacancyViews,
    required this.company,
    required this.address,
    this.description = const [],
    this.contacts = const [],
  });

  @override
  List<Object?> get props => [
        title,
        price,
        workExperience,
        dayEmployment,
        vacancyViews,
        company,
        address,
        description,
        contacts
      ];
}
