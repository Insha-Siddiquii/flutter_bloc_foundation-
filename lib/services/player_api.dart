import 'dart:convert';

import '../player/player.dart';
import 'package:http/http.dart' as http;

import '../player_category/player_category.dart';

class PlayerApi {
  Future<List<PlayerModel>> fetchplayers(String countryId) async {
    final response = await http.get(Uri.https(
      'easports.com',
      '/fifa/ultimate-team/api/fut/item',
      <String, String>{
        'country': countryId,
      },
    ));
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['items'] as List;
      return body.map((dynamic json) {
        return PlayerModel(
            id: json['composure'].toString(),
            name: json['firstName'] + ' ' + json['lastName'],
            country: json['nation']['name'],
            imageUrl:
                'https://cdnb.artstation.com/p/assets/images/images/024/651/175/large/sydney-mg-beatz-muthaphuli-neymar-cartoon-by-muthaphuli-sydney.jpg?1583105563');
      }).toList();
    }
    throw Exception('error fetching posts');
  }

  Future<List<PlayerCategoryModel>> fetchplayersCategory() async {
    final response = await http.get(Uri.https(
      'flutter-getx-auth-default-rtdb.firebaseio.com',
      '/getPlayersCategory.json',
    ));
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['-MvnkIhVwmPnreqNGJm3']
          ['category'] as List;
      return body.map((dynamic json) {
        return PlayerCategoryModel(
          id: json['id'].toString(),
          name: json['name'],
          image: json['imgUrl'],
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
