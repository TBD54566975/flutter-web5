import 'package:flutter/material.dart';
import 'package:wallet_exp/src/features/web5/did.dart';

class Persona {
  final String name;
  final Did did;

  Persona({required this.name, required this.did});

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      name: json['name'],
      did: Did.fromJson(json['did']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'did': did.toJson(),
      };

  String get asset {
    switch (name) {
      case 'Career':
        return 'assets/images/person_suit.png';
      case 'Social':
        return 'assets/images/person_suit.png';
      default:
        return 'assets/images/person_hoodie.png';
    }
  }

  Color backgroundColor(BuildContext context) {
    switch (name) {
      case 'Social':
        return Theme.of(context).colorScheme.secondary;
      case 'Career':
        return Theme.of(context).colorScheme.tertiary;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
