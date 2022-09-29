import 'package:weather/features/current_weather/data/models/coordinate.dart';
import 'package:weather/features/current_weather/data/models/current_weather.dart';

abstract class WeatherRepo {
  Future<CurrentWeather> getCurrentWeather(Coordinate coor);
}
