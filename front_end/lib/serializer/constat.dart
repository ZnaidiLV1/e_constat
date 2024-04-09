// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Constat {
  int id_constat;
  int assure;
  Constat({
    required this.id_constat,
    required this.assure,
  });

  Constat copyWith({
    int? id_constat,
    int? assure,
  }) {
    return Constat(
      id_constat: id_constat ?? this.id_constat,
      assure: assure ?? this.assure,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_constat': id_constat,
      'assure': assure,
    };
  }

  factory Constat.fromMap(Map<String, dynamic> map) {
    return Constat(
      id_constat: map['id_constat'] as int,
      assure: map['assure'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Constat.fromJson(String source) =>
      Constat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Constat(id_constat: $id_constat, assure: $assure)';

  @override
  bool operator ==(covariant Constat other) {
    if (identical(this, other)) return true;
  
    return 
      other.id_constat == id_constat &&
      other.assure == assure;
  }

  @override
  int get hashCode => id_constat.hashCode ^ assure.hashCode;
}
