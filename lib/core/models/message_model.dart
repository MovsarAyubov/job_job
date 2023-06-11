// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';

enum Sender {
  me,
  other,
}

class Message {
  final VacancyEntity vacancy;
  final String text;
  final Sender sender;
  Message({
    required this.vacancy,
    required this.text,
    required this.sender,
  });
}
