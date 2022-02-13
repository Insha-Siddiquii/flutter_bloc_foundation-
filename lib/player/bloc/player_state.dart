part of 'player_bloc.dart';

enum PlayerStatus { initial, success, failure }

class PlayerState extends Equatable {
  const PlayerState({
    this.status = PlayerStatus.initial,
    this.players = const [],
  });

  final PlayerStatus status;
  final List<PlayerModel> players;

  @override
  List<Object> get props => [status, players];

  PlayerState copyWith({
    PlayerStatus? status,
    List<PlayerModel>? players,
  }) {
    return PlayerState(
      status: status ?? this.status,
      players: players ?? this.players,
    );
  }

  @override
  String toString() {
    return '''PlayerState { status: $status,  Players: ${players.length} }''';
  }
}
