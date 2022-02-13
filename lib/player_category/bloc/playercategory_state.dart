part of 'playercategory_bloc.dart';

enum PlayerCategoryStatus { initial, success, failure }

class PlayercategoryState extends Equatable {
  const PlayercategoryState(
      {this.status = PlayerCategoryStatus.initial,
      this.playerCategory = const []});

  final PlayerCategoryStatus status;
  final List<PlayerCategoryModel> playerCategory;

  @override
  List<Object> get props => [status, playerCategory];

  PlayercategoryState copyWith({
    PlayerCategoryStatus? status,
    List<PlayerCategoryModel>? playerCategory,
    bool? hasReachedMax,
  }) {
    return PlayercategoryState(
      status: status ?? this.status,
      playerCategory: playerCategory ?? this.playerCategory,
    );
  }

  @override
  String toString() {
    return '''playerCategory { status: $status,  Players: ${playerCategory.length} }''';
  }
}
