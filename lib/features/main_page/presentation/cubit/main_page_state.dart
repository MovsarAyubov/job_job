// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  final int pageIndex;
  const MainPageState({this.pageIndex = 0});

  @override
  List<Object> get props => [pageIndex];
}
