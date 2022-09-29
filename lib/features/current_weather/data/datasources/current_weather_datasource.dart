import 'package:injectable/injectable.dart';
import 'package:weather/core/base/data/datasources/remote_data_source.dart';
import 'package:weather/features/current_weather/data/services/current_weather_service.dart';
import 'package:weather/features/current_weather/data/services/location_search_service.dart';

@injectable
class CurrentWeatherDataSource extends BaseRemoteDataSource {
  late CurrentWeatherService currentWeatherService;
  late LocationSearchService locationSearchService;
  CurrentWeatherDataSource(super.client) {
    locationSearchService = LocationSearchService.create(client);
    currentWeatherService = CurrentWeatherService.create(client);
  }
}
