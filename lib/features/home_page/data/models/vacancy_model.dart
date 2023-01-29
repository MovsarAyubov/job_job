import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

class VacancyModel extends VacancyEntity {
  const VacancyModel({required String title, required num salary})
      : super(title, salary);

  factory VacancyModel.fromJson(Map<String, dynamic> json) {
    return VacancyModel(
      title: json['title'] as String,
      salary: json['salary'],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'salary': salary,
    };
  }
}
