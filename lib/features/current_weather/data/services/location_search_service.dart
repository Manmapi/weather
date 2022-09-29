import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part 'location_search_service.chopper.dart';

@ChopperApi(baseUrl: "/geo/1.0")
abstract class LocationSearchService extends ChopperService {
  static LocationSearchService create([ChopperClient? client]) =>
      _$LocationSearchService(client);
  @Get(path: 'direct?q={cityName}&limit=1&appid={appid}')
  Future<Response> locationSearch(
      @Path() String cityName, @Path() String appid);
}
