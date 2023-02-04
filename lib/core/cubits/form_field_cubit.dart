import 'package:flutter_bloc/flutter_bloc.dart';

class FormFieldCubit extends Cubit<bool> {
  FormFieldCubit() : super(true);

  void showAndHideContent() {
    if (state) {
      emit(false);
    } else {
      emit(true);
    }
  }
}
