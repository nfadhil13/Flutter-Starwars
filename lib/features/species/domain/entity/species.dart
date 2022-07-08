import 'package:equatable/equatable.dart';

class Species extends Equatable {
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String? homeworld;
  final String language;
  final List<String> people;
  final List<String> films;

  const Species({
    required this.name,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.skinColors,
    required this.hairColors,
    required this.eyeColors,
    required this.averageLifespan,
    required this.homeworld,
    required this.language,
    required this.people,
    required this.films,
  }) : super();

  @override
  List<Object?> get props => [name];
}
