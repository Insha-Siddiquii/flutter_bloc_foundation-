import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_foundation/player/bloc/player_bloc.dart';
import 'package:flutter_bloc_foundation/player/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key, required this.playerCategoryId})
      : super(key: key);

  final String playerCategoryId;

  static const String routeName = '/playerList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Global Players'),
        ),
        body: BlocProvider(
          create: (_) => PlayerBloc(httpClient: http.Client())
            ..add(
              PlayerFetch(countryId: playerCategoryId),
            ),
          child: const PlayerList(),
        ));
  }
}
