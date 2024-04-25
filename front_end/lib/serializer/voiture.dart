// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Voiture {
  String carte_grise;
  int immatriculation;
  String marque;
  String type;
  Voiture({
    required this.carte_grise,
    required this.immatriculation,
    required this.marque,
    required this.type,
  });

  Voiture copyWith({
    String? carte_grise,
    int? immatriculation,
    String? marque,
    String? type,
  }) {
    return Voiture(
      carte_grise: carte_grise ?? this.carte_grise,
      immatriculation: immatriculation ?? this.immatriculation,
      marque: marque ?? this.marque,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carte_grise': carte_grise,
      'immatriculation': immatriculation,
      'marque': marque,
      'type': type,
    };
  }

  factory Voiture.fromMap(Map<String, dynamic> map) {
    return Voiture(
      carte_grise: map['carte_grise'] as String,
      immatriculation: map['immatriculation'] as int,
      marque: map['marque'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Voiture.fromJson(String source) => Voiture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Voiture(carte_grise: $carte_grise, immatriculation: $immatriculation, marque: $marque, type: $type)';
  }

  @override
  bool operator ==(covariant Voiture other) {
    if (identical(this, other)) return true;
  
    return 
      other.carte_grise == carte_grise &&
      other.immatriculation == immatriculation &&
      other.marque == marque &&
      other.type == type;
  }

  @override
  int get hashCode {
    return carte_grise.hashCode ^
      immatriculation.hashCode ^
      marque.hashCode ^
      type.hashCode;
  }
}
