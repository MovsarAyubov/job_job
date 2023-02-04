import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entities/account_entity.dart';

enum SignInOrUp {
  signIn,
  signUp,
}

class AuthPageState extends Equatable {
  final List<Account> accounts;
  final SignInOrUp signInOrUp;
  const AuthPageState({
    this.accounts = const [],
    this.signInOrUp = SignInOrUp.signUp,
  });

  AuthPageState copyWith({
    List<Account>? accounts,
    SignInOrUp? signInOrUp,
  }) {
    return AuthPageState(
      accounts: accounts ?? this.accounts,
      signInOrUp: signInOrUp ?? this.signInOrUp,
    );
  }

  @override
  String toString() =>
      'AuthPageState(accounts: $accounts, signInOrUp: $signInOrUp)';

  @override
  List<Object> get props => [accounts, signInOrUp];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accounts': accounts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory AuthPageState.fromMap(Map<String, dynamic> map) {
    return AuthPageState(
      accounts:
          List<Account>.from(map['accounts']?.map((x) => Account.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthPageState.fromJson(String source) =>
      AuthPageState.fromMap(json.decode(source));
}
