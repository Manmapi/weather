part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();

  @override
  List<Object> get props => [];
}

class UpdateCurrentWeather extends CurrentWeatherEvent {}

class GetCurrentWeather extends CurrentWeatherEvent {}
