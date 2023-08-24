import 'package:flutter/material.dart';

import '../core/models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: UnconstrainedBox(
        child: Container(
          height: 100,
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width - 40,
          child: Text(
            character.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(character.image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}
