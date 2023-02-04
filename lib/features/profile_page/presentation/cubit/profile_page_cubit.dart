import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_page_state.dart';

class ProfilePageDartCubit extends Cubit<ProfilePageDartState> {
  ProfilePageDartCubit() : super(ProfilePageDartInitial());
}
