import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tdd_sytex/domain/domain.dart';

class MarvelHeroesRepositoryImpl implements MarvelHeroesRepository {
  const MarvelHeroesRepositoryImpl(this._httpClient);

  final http.Client _httpClient;

  static final endpoint = Uri.parse(
    'https://getpantry.cloud/apiv1/pantry/22e4ec0f-5ed3-4e2a-861b-b28731d2d889/basket/marvel',
  );

  @override
  Future<List<MarvelHero>> fetch() async {
    final response = await _httpClient.get(endpoint);

    if (response.statusCode != 200) throw Exception('Server error');

    final decodedBody = json.decode(response.body);
    final heroMaps = decodedBody['results'] as List;
    final heroes = <MarvelHero>[];
    for (final heroMap in heroMaps) {
      heroes.add(
        MarvelHero(
          name: heroMap['name'] as String,
          abilities: (heroMap['abilities'] as List).cast<String>(),
          photoUrl: heroMap['photo_url'] as String,
          isDeceased: heroMap['is_deceased'] as bool,
        ),
      );
    }
    return heroes;
  }
}
