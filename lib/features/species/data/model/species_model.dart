import '../../domain/entity/species.dart';

class SpeciesModel extends Species {
  const SpeciesModel({
    required super.name,
    required super.classification,
    required super.designation,
    required super.averageHeight,
    required super.skinColors,
    required super.hairColors,
    required super.eyeColors,
    required super.averageLifespan,
    required super.homeworld,
    required super.language,
    required super.people,
    required super.films
  });

  factory SpeciesModel.fromJSON(Map<String, dynamic> json) {
    return SpeciesModel(
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      averageHeight: json['average_height'],
      skinColors: json['skin_colors'],
      hairColors: json['hair_colors'],
      eyeColors: json['eye_colors'],
      averageLifespan: json['average_lifespan'],
      homeworld: json['homeworld'],
      language: json['language'],
      people: json['people'].cast<String>(),
      films: json['films'].cast<String>(),
    );
  }
}
