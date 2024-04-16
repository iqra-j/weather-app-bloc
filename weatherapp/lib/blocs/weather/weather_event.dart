part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetch extends WeatherBlocEvent {
  final Position position;

  const WeatherFetch(this.position);

  @override
  List<Object> get props => [position];
}
