import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'searching_settings_state.dart';

@LazySingleton()
class SearchingSettingsCubit extends Cubit<SearchingSettingsState> {
  SearchingSettingsCubit() : super(const SearchingSettingsState());

  double salary = 0;
  List<String> cities = [
    "Россия",
    "Москва",
    "Санкт-Петербург",
    "Чеченская республика",
    "Волгоградская область",
    "Ростовская область"
  ];
  List<int> keys = [113, 1, 2, 1500, 1511, 1530];
  String city = "Россия";

  int get areaNumber => cities.indexWhere((element) => element == city);

  void settingSearch() {
    emit(
        SearchingSettingsState(salary: salary, areaOfSearch: keys[areaNumber]));
  }
}
