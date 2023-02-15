// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:poisk_raboty/core/api/main_api.dart' as _i6;
import 'package:poisk_raboty/core/cubits/favorites_cached/favorits_cubit.dart'
    as _i5;
import 'package:poisk_raboty/features/auth_page/presentation/cubit/account_in_system_cubit.dart'
    as _i3;
import 'package:poisk_raboty/features/auth_page/presentation/cubit/auth_page_cubit.dart'
    as _i4;
import 'package:poisk_raboty/features/concrete_vacancy/data/datasources/detailed_vacancy_source.dart'
    as _i12;
import 'package:poisk_raboty/features/concrete_vacancy/data/datasources/detailed_vacancy_source_impl.dart'
    as _i13;
import 'package:poisk_raboty/features/concrete_vacancy/data/repositories/concrete_vacancy_repository_impl.dart'
    as _i17;
import 'package:poisk_raboty/features/concrete_vacancy/domain/repositories/concrete_vacancy_repository.dart'
    as _i16;
import 'package:poisk_raboty/features/concrete_vacancy/domain/usecases/fetch_detailed_vacancy.dart'
    as _i18;
import 'package:poisk_raboty/features/concrete_vacancy/presentation/cubit/concrete_vacancy_cubit.dart'
    as _i19;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart'
    as _i8;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source_impl.dart'
    as _i9;
import 'package:poisk_raboty/features/home_page/data/repositories/vacancies_repository_impl.dart'
    as _i11;
import 'package:poisk_raboty/features/home_page/domain/repositories/vacancy_repository.dart'
    as _i10;
import 'package:poisk_raboty/features/home_page/domain/usecases/fetch_vacancies.dart'
    as _i14;
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart'
    as _i15;
import 'package:poisk_raboty/features/search_setting_page/presentation/cubit/searching_settings_cubit.dart'
    as _i7;

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
  gh.lazySingleton<_i3.AccountInSystemCubit>(() => _i3.AccountInSystemCubit());
  gh.lazySingleton<_i4.AuthPageCubit>(
      () => _i4.AuthPageCubit(gh<_i3.AccountInSystemCubit>()));
  gh.lazySingleton<_i5.FavoriteVacancyCubit>(() => _i5.FavoriteVacancyCubit());
  gh.lazySingleton<_i6.MainApi>(() => _i6.MainApi());
  gh.lazySingleton<_i7.SearchingSettingsCubit>(
      () => _i7.SearchingSettingsCubit());
  gh.lazySingleton<_i8.VacanciesSource>(
      () => _i9.VacanciesSourceImpl(gh<_i6.MainApi>()));
  gh.lazySingleton<_i10.VacancyRepository>(
      () => _i11.VacanciesRepasitoryImpl(source: gh<_i8.VacanciesSource>()));
  gh.lazySingleton<_i12.ConcreteVacancySource>(
      () => _i13.ConcreteVacancySourceImpl(gh<_i6.MainApi>()));
  gh.lazySingleton<_i14.FetchVacancies>(
      () => _i14.FetchVacancies(repository: gh<_i10.VacancyRepository>()));
  gh.lazySingleton<_i15.HomePageCubit>(
      () => _i15.HomePageCubit(gh<_i14.FetchVacancies>()));
  gh.lazySingleton<_i16.ConcreteVacancyRepository>(() =>
      _i17.ConcreteVacancyRepositoryImpl(
          source: gh<_i12.ConcreteVacancySource>()));
  gh.lazySingleton<_i18.FetchDetailedVacancy>(() => _i18.FetchDetailedVacancy(
      repository: gh<_i16.ConcreteVacancyRepository>()));
  gh.factory<_i19.ConcreteVacancyCubit>(() =>
      _i19.ConcreteVacancyCubit(useCase: gh<_i18.FetchDetailedVacancy>()));
  return getIt;
}
