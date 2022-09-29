import 'package:injectable/injectable.dart';
import 'package:weather/core/constant/api_contanst.dart';
import 'package:weather/features/current_weather/data/datasources/current_weather_datasource.dart';
import 'package:weather/features/current_weather/data/models/location.dart';
import 'package:weather/features/current_weather/domain/repositories/location_search_repo.dart';

@Injectable(as: LocationSearchRepo)
class LocationSearchRepoImp extends LocationSearchRepo {
  final CurrentWeatherDataSource currentWeatherDataSource;
  LocationSearchRepoImp(this.currentWeatherDataSource);
  @override
  Future<Location> locationSearch(String citiName) async {
    try {
      final response = await currentWeatherDataSource.locationSearchService
          .locationSearch(citiName, ApiContanst.apiKey);
      final json = response.body ?? {};
      if (response.isSuccessful) {
        print(json);
        return Location.fromJson(json[0]);
      } else {
        throw 'error';
      }
    } catch (e) {
      rethrow;
    }
  }
}
