import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

class VacancyModel extends VacancyEntity {
  const VacancyModel(
      {required String link,
      required int id,
      bool isReviewed = false,
      required String title,
      required String salary,
      required String address,
      required String description,
      required String company})
      : super(
            link: link,
            id: id,
            isReviewed: isReviewed,
            title: title,
            salary: salary,
            company: company,
            description: description,
            address: address);

  factory VacancyModel.fromJson(Map<String, dynamic> json) {
    return VacancyModel(
      link: json['link'] as String,
      id: json['id'] as int,
      isReviewed: json['isReviewed'] as bool,
      title: json['title'] as String,
      salary: json['salary'] as String,
      company: json['company'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'link': link,
      'id': id,
      'isReviewed': isReviewed,
      'title': title,
      'salary': salary,
      'description': description,
      'address': address,
      "company": company,
    };
  }
}
