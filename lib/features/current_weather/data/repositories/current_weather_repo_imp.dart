import 'package:injectable/injectable.dart';
import 'package:weather/core/constant/api_contanst.dart';
import 'package:weather/features/current_weather/data/datasources/current_weather_datasource.dart';
import 'package:weather/features/current_weather/data/models/coordinate.dart';
import 'package:weather/features/current_weather/data/models/current_weather.dart';

import 'package:weather/features/current_weather/domain/repositories/current_weather_repo.dart';

@Injectable(as: WeatherRepo)
class CurrentWeatherRepoImp extends WeatherRepo {
  final CurrentWeatherDataSource currentWeatherDataSource;
  CurrentWeatherRepoImp(this.currentWeatherDataSource);
  @override
  Future<CurrentWeather> getCurrentWeather(Coordinate coor) async {
    try {
      final response = await currentWeatherDataSource.currentWeatherService
          .getWeather(coor.lat, coor.lon, ApiContanst.apiKey);
      final json = response.body ?? {};
      if (response.isSuccessful) {
        return CurrentWeather.fromJson(json);
      } else {
        throw ((response.error! as Map)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
