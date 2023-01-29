// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:poisk_raboty/core/api/main_api.dart' as _i3;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart'
    as _i4;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source_impl.dart'
    as _i5;
import 'package:poisk_raboty/features/home_page/data/repositories/vacancies_repository_impl.dart'
    as _i7;
import 'package:poisk_raboty/features/home_page/domain/repositories/vacancy_repository.dart'
    as _i6;
import 'package:poisk_raboty/features/home_page/domain/usecases/fetch_vacancies.dart'
    as _i8;
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart'
    as _i9;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.MainApi>(() => _i3.MainApi());
  gh.lazySingleton<_i4.VacanciesSource>(
      () => _i5.VacanciesSourceImpl(gh<_i3.MainApi>()));
  gh.lazySingleton<_i6.VacancyRepository>(
      () => _i7.VacanciesRepasitoryImpl(source: gh<_i4.VacanciesSource>()));
  gh.lazySingleton<_i8.FetchVacancies>(
      () => _i8.FetchVacancies(repository: gh<_i6.VacancyRepository>()));
  gh.factory<_i9.HomePageCubit>(
      () => _i9.HomePageCubit(gh<_i8.FetchVacancies>()));
  return getIt;
}
