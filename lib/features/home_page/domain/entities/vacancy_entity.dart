// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class VacancyEntity extends Equatable {
  final String link;
  final int id;
  final bool isReviewed;
  final String title;
  final String salary;
  final String description;
  final String company;
  final String address;

  const VacancyEntity({
    required this.link,
    this.id = 0,
    this.isReviewed = false,
    required this.title,
    required this.salary,
    required this.description,
    required this.company,
    required this.address,
  });

  @override
  List<Object?> get props =>
      [title, salary, description, company, address, isReviewed, id, link];

  VacancyEntity copyWith({
    String? link,
    String? title,
    String? salary,
    String? description,
    String? company,
    String? address,
    bool? isReviewed,
  }) {
    return VacancyEntity(
        link: link ?? this.link,
        title: title ?? this.title,
        salary: salary ?? this.salary,
        description: description ?? this.description,
        company: company ?? this.company,
        address: address ?? this.address,
        isReviewed: isReviewed ?? this.isReviewed);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
      'isReviewed': isReviewed,
      'title': title,
      'salary': salary,
      'description': description,
      'company': company,
      'address': address,
    };
  }

  factory VacancyEntity.fromMap(Map<String, dynamic> map) {
    return VacancyEntity(
      link: map['link'] as String,
      isReviewed: map['isReviewed'] as bool,
      title: map['title'] as String,
      salary: map['salary'] as String,
      description: map['description'] as String,
      company: map['company'] as String,
      address: map['address'] as String,
    );
  }

  @override
  bool get stringify => true;
}
