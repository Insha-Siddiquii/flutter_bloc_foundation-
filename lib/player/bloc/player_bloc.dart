import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_foundation/player/models/player_model.dart';
import 'package:flutter_bloc_foundation/services/services.dart';
import 'package:http/http.dart' as http;

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc({required this.httpClient}) : super(const PlayerState()) {
    on<PlayerFetch>(_onPlayerFetched);
  }

  final http.Client httpClient;

  Future<void> _onPlayerFetched(
      PlayerFetch event, Emitter<PlayerState> emit) async {
    try {
      final players = await PlayerApi().fetchplayers(event.countryId);
      emit(state.copyWith(
        status: PlayerStatus.success,
        players: List.of(state.players)..addAll(players),
      ));
    } catch (_) {
      emit(state.copyWith(status: PlayerStatus.failure));
    }
  }
}
