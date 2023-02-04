// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String userName;
  final String password;
  final String email;
  final String phoneNumber;
  const Account({
    required this.userName,
    required this.password,
    this.email = "",
    this.phoneNumber = "",
  });

  @override
  List<Object> get props => [userName, password, email, phoneNumber];

  Account copyWith({
    String? userName,
    String? password,
    String? email,
    String? phoneNumber,
  }) {
    return Account(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      userName: map['userName'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  @override
  String toString() => 'Account(userName: $userName, password: $password)';

  @override
  bool get stringify => true;
}
