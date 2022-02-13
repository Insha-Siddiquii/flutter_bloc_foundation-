import 'package:equatable/equatable.dart';

class PlayerModel extends Equatable {
  const PlayerModel({
    required this.id,
    required this.name,
    required this.country,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String country;
  final String imageUrl;

  @override
  List<Object?> get props => [id, name, country, imageUrl];
}
