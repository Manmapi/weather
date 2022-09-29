import 'package:weather/features/current_weather/data/models/location.dart';

abstract class LocationSearchRepo {
  Future<Location> locationSearch(String citiName);
}
