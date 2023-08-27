import 'character.dart';

class CharacterDetails extends Character {
  final String status;
  final String species;
  final String gender;
  final String location;
  final String? type;

  CharacterDetails({
    required super.image,
    required super.name,
    required super.id,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.location,
  });

  factory CharacterDetails.fromJson(Map<String, dynamic> json) {
    return CharacterDetails(
      name: json['name'],
      id: json['id'],
      image: json['image'],
      gender: json['gender'],
      location: json['location']['name'],
      species: json['species'],
      status: json['status'],
      type: (json['type'] as String).isEmpty ? null : json['type'],
    );
  }
}
