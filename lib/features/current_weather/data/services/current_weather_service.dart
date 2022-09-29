import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part 'current_weather_service.chopper.dart';

@ChopperApi(baseUrl: "/data/2.5/weather")
abstract class CurrentWeatherService extends ChopperService {
  static CurrentWeatherService create([ChopperClient? client]) =>
      _$CurrentWeatherService(client);
  @Get(path: '?lat={lat}&lon={long}&units=metric&appid={appid}')
  Future<Response> getWeather(
      @Path() double lat, @Path() double long, @Path() String appid);
}
