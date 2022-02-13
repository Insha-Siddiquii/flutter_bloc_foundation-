import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_foundation/player_category/player_category.dart';
import 'package:http/http.dart' as http;

class PlayercategoryView extends StatelessWidget {
  const PlayercategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Category'),
      ),
      body: BlocProvider(
        create: (_) => PlayercategoryBloc(httpClient: http.Client())
          ..add(
            PlayerCategoryFetch(),
          ),
        child: const PlayerCategoryGrid(),
      ),
    );
  }
}
