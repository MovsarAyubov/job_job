import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_setting_page_state.dart';

class SearchSettingPageCubit extends Cubit<SearchSettingPageState> {
  SearchSettingPageCubit() : super(SearchSettingPageInitial());
}
