// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:poisk_raboty/core/api/main_api.dart' as _i4;
import 'package:poisk_raboty/core/cubits/favorites_cached/favorits_cubit.dart'
    as _i3;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart'
    as _i5;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source_impl.dart'
    as _i6;
import 'package:poisk_raboty/features/home_page/data/repositories/vacancies_repository_impl.dart'
    as _i8;
import 'package:poisk_raboty/features/home_page/domain/repositories/vacancy_repository.dart'
    as _i7;
import 'package:poisk_raboty/features/home_page/domain/usecases/fetch_vacancies.dart'
    as _i9;
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart'
    as _i10;

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
  gh.lazySingleton<_i3.FavoriteVacancyCubit>(() => _i3.FavoriteVacancyCubit());
  gh.lazySingleton<_i4.MainApi>(() => _i4.MainApi());
  gh.lazySingleton<_i5.VacanciesSource>(
      () => _i6.VacanciesSourceImpl(gh<_i4.MainApi>()));
  gh.lazySingleton<_i7.VacancyRepository>(
      () => _i8.VacanciesRepasitoryImpl(source: gh<_i5.VacanciesSource>()));
  gh.lazySingleton<_i9.FetchVacancies>(
      () => _i9.FetchVacancies(repository: gh<_i7.VacancyRepository>()));
  gh.factory<_i10.HomePageCubit>(
      () => _i10.HomePageCubit(gh<_i9.FetchVacancies>()));
  return getIt;
}
