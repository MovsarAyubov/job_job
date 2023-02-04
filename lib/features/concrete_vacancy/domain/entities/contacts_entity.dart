// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ContactsEntity extends Equatable {
  final String email;
  final String phoneNumber;
  final String name;
  const ContactsEntity({
    required this.email,
    required this.phoneNumber,
    required this.name,
  });

  @override
  List<Object?> get props => [
        email,
        phoneNumber,
        name,
      ];
}
