class Character {
  final String image;
  final String name;
  final int id;

  Character({
    required this.image,
    required this.name,
    required this.id,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      image: json['image'],
      name: json['name'],
      id: json['id'],
    );
  }
}
