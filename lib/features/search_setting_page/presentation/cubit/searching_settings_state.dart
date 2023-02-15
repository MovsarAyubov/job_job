// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SearchingSettingsState extends Equatable {
  final double salary;
  final int areaOfSearch;
  const SearchingSettingsState({
    this.salary = 0,
    this.areaOfSearch = 113,
  });
  @override
  List<Object?> get props => [salary, areaOfSearch];
}
