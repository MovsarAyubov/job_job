import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entities/account_entity.dart';

class AccountInSystemState extends Equatable {
  final Account accountInSystem;
  final bool logged;
  const AccountInSystemState({
    this.accountInSystem =
        const Account(userName: '', password: '', email: '', phoneNumber: ''),
    this.logged = false,
  });

  @override
  List<Object> get props => [accountInSystem, logged];

  AccountInSystemState copyWith({
    Account? accountInSystem,
    bool? logged,
  }) {
    return AccountInSystemState(
      accountInSystem: accountInSystem ?? this.accountInSystem,
      logged: logged ?? this.logged,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accountInSystem': accountInSystem.toMap()});
    result.addAll({'logged': logged});

    return result;
  }

  factory AccountInSystemState.fromMap(Map<String, dynamic> map) {
    return AccountInSystemState(
      accountInSystem: Account.fromMap(map['accountInSystem']),
      logged: map['logged'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountInSystemState.fromJson(String source) =>
      AccountInSystemState.fromMap(json.decode(source));

  @override
  String toString() =>
      'AccountInSystemState(accountInSystem: $accountInSystem, logged: $logged)';
}
