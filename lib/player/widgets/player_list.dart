import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_foundation/player/player.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        switch (state.status) {
          case PlayerStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case PlayerStatus.success:
            return ListView.builder(
              itemCount: state.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.players[index].name),
                  subtitle: Text(state.players[index].country),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      state.players[index].imageUrl,
                    ),
                  ),
                );
              },
            );
          case PlayerStatus.failure:
            return const Center(child: Text('Error'));
          default:
            return Container();
        }
      },
    );
  }
}
