import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/services/location_service.dart';
import 'package:weather/features/current_weather/data/models/coordinate.dart';
import 'package:weather/features/current_weather/data/models/current_weather.dart';
import 'package:weather/features/current_weather/domain/repositories/current_weather_repo.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

@singleton
class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  late CurrentWeather currentWeather;
  final WeatherRepo weatherRepo;
  CurrentWeatherBloc(this.weatherRepo) : super(CurrentWeatherInitial()) {
    on<UpdateCurrentWeather>((event, emit) async {
      try {
        final Position position = await determinePosition();

        currentWeather = await weatherRepo.getCurrentWeather(
            Coordinate(position.latitude, position.longitude));
        add(GetCurrentWeather());
      } catch (e) {
        print(e);
      }
    });
    on<GetCurrentWeather>((event, emit) async {
      emit(CurrentWeatherLoaded(currentWeather));
    });
  }
}
