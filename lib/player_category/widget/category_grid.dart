import 'package:flutter/material.dart';

import 'package:flutter_bloc_foundation/player_category/player_category.dart';
import 'package:flutter_bloc_foundation/player/player.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key, required this.categories}) : super(key: key);

  final List<PlayerCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PlayerView(
                  playerCategoryId: categories[index].id,
                ),
              ),
            );
          },
          child: Card(
            semanticContainer: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  opacity: 40,
                  image: NetworkImage(
                    categories[index].image,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(categories[index].name,
                      style: const TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
