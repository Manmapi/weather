import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/constant/api_contanst.dart';

@Injectable(as: ChopperClient)
class ApiClient extends ChopperClient {
  ApiClient()
      : super(
          baseUrl: ApiContanst.baseUrl,
          converter: const JsonConverter(),
          errorConverter: const JsonConverter(),
          interceptors: [HttpLoggingInterceptor()],
          services: [],
        );
}
