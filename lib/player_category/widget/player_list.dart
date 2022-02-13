import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_foundation/player_category/player_category.dart';

class PlayerCategoryGrid extends StatelessWidget {
  const PlayerCategoryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayercategoryBloc, PlayercategoryState>(
      builder: (context, state) {
        switch (state.status) {
          case PlayerCategoryStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case PlayerCategoryStatus.success:
            return CategoryGrid(
              categories: state.playerCategory,
            );

          case PlayerCategoryStatus.failure:
            return const Center(child: Text('Error'));
          default:
            return Container();
        }
      },
    );
  }
}
