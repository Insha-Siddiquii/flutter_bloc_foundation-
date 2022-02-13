import 'package:equatable/equatable.dart';

class PlayerCategoryModel extends Equatable {
  @override
  List<Object?> get props => [id, name, image];

  final String id;
  final String name;
  final String image;

  const PlayerCategoryModel(
      {required this.id, required this.name, required this.image});
}
