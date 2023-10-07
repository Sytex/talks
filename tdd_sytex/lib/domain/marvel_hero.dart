import 'package:equatable/equatable.dart';

class MarvelHero extends Equatable {
  const MarvelHero({
    required this.name,
    required this.photoUrl,
    this.abilities = const [],
    this.isDeceased = false,
  });

  final String name;

  final List<String> abilities;

  final String photoUrl;

  final bool isDeceased;

  @override
  List<Object> get props => [name, abilities, photoUrl, isDeceased];
}
