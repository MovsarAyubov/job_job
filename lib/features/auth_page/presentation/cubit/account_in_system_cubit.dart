import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/account_entity.dart';
import 'account_in_system_state.dart';

@LazySingleton()
class AccountInSystemCubit extends HydratedCubit<AccountInSystemState> {
  AccountInSystemCubit() : super(const AccountInSystemState());

  void signIn(Account account) {
    emit(AccountInSystemState(accountInSystem: account, logged: true));
  }

  void exitFromSystem() {
    emit(const AccountInSystemState(
        accountInSystem: Account(password: "", userName: ""), logged: false));
  }

  @override
  AccountInSystemState? fromJson(Map<String, dynamic> json) =>
      AccountInSystemState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AccountInSystemState state) => state.toMap();
}
