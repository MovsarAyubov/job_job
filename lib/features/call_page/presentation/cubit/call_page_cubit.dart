import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'call_page_state.dart';

class CallPageCubit extends Cubit<CallPageState> {
  CallPageCubit() : super(CallPageInitial());
}
