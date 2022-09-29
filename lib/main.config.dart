// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/services/chopper_client.dart' as _i4;
import 'features/current_weather/data/datasources/current_weather_datasource.dart'
    as _i5;
import 'features/current_weather/data/repositories/current_weather_repo_imp.dart'
    as _i9;
import 'features/current_weather/data/repositories/location_search_repo_imp.dart'
    as _i7;
import 'features/current_weather/domain/repositories/current_weather_repo.dart'
    as _i8;
import 'features/current_weather/domain/repositories/location_search_repo.dart'
    as _i6;
import 'features/current_weather/presentation/bloc/current_weather_bloc.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ChopperClient>(() => _i4.ApiClient());
  gh.factory<_i5.CurrentWeatherDataSource>(
      () => _i5.CurrentWeatherDataSource(get<_i3.ChopperClient>()));
  gh.factory<_i6.LocationSearchRepo>(
      () => _i7.LocationSearchRepoImp(get<_i5.CurrentWeatherDataSource>()));
  gh.factory<_i8.WeatherRepo>(
      () => _i9.CurrentWeatherRepoImp(get<_i5.CurrentWeatherDataSource>()));
  gh.singleton<_i10.CurrentWeatherBloc>(
      _i10.CurrentWeatherBloc(get<_i8.WeatherRepo>()));
  return get;
}
