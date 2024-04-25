// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:front_end1/serializer/constat.dart';

class Accident {
  int constat;
  String lieu_accident;
  String date_accident;
  Accident({
    required this.constat,
    required this.lieu_accident,
    required this.date_accident,
  });

  Accident copyWith({
    int? constat,
    String? lieu_accident,
    String? date_accident,
  }) {
    return Accident(
      constat: constat ?? this.constat,
      lieu_accident: lieu_accident ?? this.lieu_accident,
      date_accident: date_accident ?? this.date_accident,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'constat': constat,
      'lieu_accident': lieu_accident,
      'date_accident': date_accident,
    };
  }

  factory Accident.fromMap(Map<String, dynamic> map) {
    return Accident(
      constat: map['constat'] as int,
      lieu_accident: map['lieu_accident'] as String,
      date_accident: map['date_accident'] as String,
    );
  }
  String toJson() => json.encode(toMap());
  factory Accident.fromJson(String source) => Accident.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Accident(constat: $constat, lieu_accident: $lieu_accident, date_accident: $date_accident)';

  @override
  bool operator ==(covariant Accident other) {
    if (identical(this, other)) return true;
  
    return 
      other.constat == constat &&
      other.lieu_accident == lieu_accident &&
      other.date_accident == date_accident;
  }

  @override
  int get hashCode => constat.hashCode ^ lieu_accident.hashCode ^ date_accident.hashCode;
}
