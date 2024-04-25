// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Constat {
  int id_constat;
  int assure;
  int numr_tlfn_autre_assure;
  Constat({
    required this.id_constat,
    required this.assure,
    required this.numr_tlfn_autre_assure,
  });

  Constat copyWith({
    int? id_constat,
    int? assure,
    int? numr_tlfn_autre_assure,
  }) {
    return Constat(
      id_constat: id_constat ?? this.id_constat,
      assure: assure ?? this.assure,
      numr_tlfn_autre_assure:
          numr_tlfn_autre_assure ?? this.numr_tlfn_autre_assure,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_constat': id_constat,
      'assure': assure,
      'numr_tlfn_autre_assure': numr_tlfn_autre_assure,
    };
  }

  factory Constat.fromMap(Map<String, dynamic> map) {
    return Constat(
      id_constat: map['id_constat'] as int,
      assure: map['assure'] as int,
      numr_tlfn_autre_assure: map['numr_tlfn_autre_assure'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Constat.fromJson(String source) =>
      Constat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Constat(id_constat: $id_constat, assure: $assure, numr_tlfn_autre_assure: $numr_tlfn_autre_assure)';

  @override
  bool operator ==(covariant Constat other) {
    if (identical(this, other)) return true;

    return other.id_constat == id_constat &&
        other.assure == assure &&
        other.numr_tlfn_autre_assure == numr_tlfn_autre_assure;
  }

  @override
  int get hashCode =>
      id_constat.hashCode ^ assure.hashCode ^ numr_tlfn_autre_assure.hashCode;
}
