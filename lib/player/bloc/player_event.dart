part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayerFetch extends PlayerEvent {
  const PlayerFetch({required this.countryId});

  final String countryId;
}
