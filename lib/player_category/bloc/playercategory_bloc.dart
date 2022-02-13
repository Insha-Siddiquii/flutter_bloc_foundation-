import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_foundation/services/services.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

part 'playercategory_event.dart';
part 'playercategory_state.dart';

class PlayercategoryBloc
    extends Bloc<PlayercategoryEvent, PlayercategoryState> {
  PlayercategoryBloc({required this.httpClient})
      : super(
          const PlayercategoryState(),
        ) {
    on<PlayerCategoryFetch>(_onPlayerCategoryFetched);
  }

  final http.Client httpClient;

  Future<void> _onPlayerCategoryFetched(
      PlayerCategoryFetch event, Emitter<PlayercategoryState> emit) async {
    try {
      final playersCategory = await PlayerApi().fetchplayersCategory();
      emit(state.copyWith(
        status: PlayerCategoryStatus.success,
        playerCategory: List.of(state.playerCategory)..addAll(playersCategory),
      ));
    } catch (_) {
      emit(state.copyWith(status: PlayerCategoryStatus.failure));
    }
  }
}
