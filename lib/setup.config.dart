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
    as _i11;
import 'package:poisk_raboty/features/concrete_vacancy/data/datasources/detailed_vacancy_source_impl.dart'
    as _i12;
import 'package:poisk_raboty/features/concrete_vacancy/data/repositories/concrete_vacancy_repository_impl.dart'
    as _i16;
import 'package:poisk_raboty/features/concrete_vacancy/domain/repositories/concrete_vacancy_repository.dart'
    as _i15;
import 'package:poisk_raboty/features/concrete_vacancy/domain/usecases/fetch_detailed_vacancy.dart'
    as _i17;
import 'package:poisk_raboty/features/concrete_vacancy/presentation/cubit/concrete_vacancy_cubit.dart'
    as _i18;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart'
    as _i7;
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source_impl.dart'
    as _i8;
import 'package:poisk_raboty/features/home_page/data/repositories/vacancies_repository_impl.dart'
    as _i10;
import 'package:poisk_raboty/features/home_page/domain/repositories/vacancy_repository.dart'
    as _i9;
import 'package:poisk_raboty/features/home_page/domain/usecases/fetch_vacancies.dart'
    as _i13;
import 'package:poisk_raboty/features/home_page/presentation/cubit/home_page_cubit.dart'
    as _i14;

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
  gh.lazySingleton<_i7.VacanciesSource>(
      () => _i8.VacanciesSourceImpl(gh<_i6.MainApi>()));
  gh.lazySingleton<_i9.VacancyRepository>(
      () => _i10.VacanciesRepasitoryImpl(source: gh<_i7.VacanciesSource>()));
  gh.lazySingleton<_i11.ConcreteVacancySource>(
      () => _i12.ConcreteVacancySourceImpl(gh<_i6.MainApi>()));
  gh.lazySingleton<_i13.FetchVacancies>(
      () => _i13.FetchVacancies(repository: gh<_i9.VacancyRepository>()));
  gh.factory<_i14.HomePageCubit>(
      () => _i14.HomePageCubit(gh<_i13.FetchVacancies>()));
  gh.lazySingleton<_i15.ConcreteVacancyRepository>(() =>
      _i16.ConcreteVacancyRepositoryImpl(
          source: gh<_i11.ConcreteVacancySource>()));
  gh.lazySingleton<_i17.FetchDetailedVacancy>(() => _i17.FetchDetailedVacancy(
      repository: gh<_i15.ConcreteVacancyRepository>()));
  gh.factory<_i18.ConcreteVacancyCubit>(() =>
      _i18.ConcreteVacancyCubit(useCase: gh<_i17.FetchDetailedVacancy>()));
  return getIt;
}
