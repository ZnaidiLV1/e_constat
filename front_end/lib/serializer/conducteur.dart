// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:front_end1/serializer/assure.dart';

class Conducteur {
  int assures;
  int numr_tlfn;
  String first_name;
  String last_name;
  int num_permis;
  Conducteur({
    required this.assures,
    required this.numr_tlfn,
    required this.first_name,
    required this.last_name,
    required this.num_permis,
  });

  Conducteur copyWith({
    int? assures,
    int? numr_tlfn,
    String? first_name,
    String? last_name,
    int? num_permis,
  }) {
    return Conducteur(
      assures: assures ?? this.assures,
      numr_tlfn: numr_tlfn ?? this.numr_tlfn,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      num_permis: num_permis ?? this.num_permis,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'assures': assures,
      'numr_tlfn': numr_tlfn,
      'first_name': first_name,
      'last_name': last_name,
      'num_permis': num_permis,
    };
  }

  factory Conducteur.fromMap(Map<String, dynamic> map) {
    return Conducteur(
      assures: map['assures'] as int,
      numr_tlfn: map['numr_tlfn'] as int,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      num_permis: map['num_permis'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conducteur.fromJson(String source) => Conducteur.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Conducteur(assures: $assures, numr_tlfn: $numr_tlfn, first_name: $first_name, last_name: $last_name, num_permis: $num_permis)';
  }

  @override
  bool operator ==(covariant Conducteur other) {
    if (identical(this, other)) return true;
  
    return 
      other.assures == assures &&
      other.numr_tlfn == numr_tlfn &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.num_permis == num_permis;
  }

  @override
  int get hashCode {
    return assures.hashCode ^
      numr_tlfn.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      num_permis.hashCode;
  }
}
