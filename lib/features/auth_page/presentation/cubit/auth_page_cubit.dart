import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/account_entity.dart';
import '../../domain/entities/account_request_entity.dart';
import 'account_in_system_cubit.dart';
import 'auth_page_state.dart';

@LazySingleton()
class AuthPageCubit extends HydratedCubit<AuthPageState> {
  final AccountInSystemCubit accountInSystemCubit;
  final AccountRequestEntity entity = AccountRequestEntity();
  AuthPageCubit(this.accountInSystemCubit) : super(const AuthPageState());

  bool get isSigningIn => state.signInOrUp == SignInOrUp.signIn;
  bool get isSigningUp => state.signInOrUp == SignInOrUp.signUp;

  bool get isUserNameExist {
    return state.accounts.any((element) => element.userName == entity.name);
  }

  bool get isUserExist {
    return state.accounts.contains(Account(
        userName: entity.name,
        password: entity.pwd,
        email: entity.email,
        phoneNumber: entity.phoneNumber));
  }

  void call() {}

  void signInOrUp() {
    if (state.signInOrUp == SignInOrUp.signUp) {
      emit(state.copyWith(signInOrUp: SignInOrUp.signIn));
    } else {
      emit(state.copyWith(signInOrUp: SignInOrUp.signUp));
    }
  }

  void signUp() {
    if (!isUserNameExist) {
      final account = Account(
          userName: entity.name,
          password: entity.pwd,
          email: entity.email,
          phoneNumber: entity.phoneNumber);
      final list = List<Account>.from(state.accounts)..add(account);
      emit(AuthPageState(accounts: list));
    }
  }

  void signIn() {
    final account = Account(
        userName: entity.name,
        password: entity.pwd,
        email: entity.email,
        phoneNumber: entity.phoneNumber);
    if (isUserExist) {
      accountInSystemCubit.signIn(account);
    }
  }

  @override
  AuthPageState? fromJson(Map<String, dynamic> json) =>
      AuthPageState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AuthPageState state) => state.toMap();
}
