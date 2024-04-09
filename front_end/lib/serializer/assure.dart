// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class assure {
  int numr_tlfn;
  String first_name;
  String last_name;
  String email_user;
  int num_permis;
  int numr_tlfn_autre_assure;
  assure({
    required this.numr_tlfn,
    required this.first_name,
    required this.last_name,
    required this.email_user,
    required this.num_permis,
    required this.numr_tlfn_autre_assure,
  });

  assure copyWith({
    int? numr_tlfn,
    String? first_name,
    String? last_name,
    String? email_user,
    int? num_permis,
    int? numr_tlfn_autre_assure,
  }) {
    return assure(
      numr_tlfn: numr_tlfn ?? this.numr_tlfn,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email_user: email_user ?? this.email_user,
      num_permis: num_permis ?? this.num_permis,
      numr_tlfn_autre_assure: numr_tlfn_autre_assure ?? this.numr_tlfn_autre_assure,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numr_tlfn': numr_tlfn,
      'first_name': first_name,
      'last_name': last_name,
      'email_user': email_user,
      'num_permis': num_permis,
      'numr_tlfn_autre_assure': numr_tlfn_autre_assure,
    };
  }

  factory assure.fromMap(Map<String, dynamic> map) {
    return assure(
      numr_tlfn: map['numr_tlfn'] as int,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      email_user: map['email_user'] as String,
      num_permis: map['num_permis'] as int,
      numr_tlfn_autre_assure: map['numr_tlfn_autre_assure'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory assure.fromJson(String source) => assure.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'assure(numr_tlfn: $numr_tlfn, first_name: $first_name, last_name: $last_name, email_user: $email_user, num_permis: $num_permis, numr_tlfn_autre_assure: $numr_tlfn_autre_assure)';
  }

  @override
  bool operator ==(covariant assure other) {
    if (identical(this, other)) return true;
  
    return 
      other.numr_tlfn == numr_tlfn &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email_user == email_user &&
      other.num_permis == num_permis &&
      other.numr_tlfn_autre_assure == numr_tlfn_autre_assure;
  }

  @override
  int get hashCode {
    return numr_tlfn.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email_user.hashCode ^
      num_permis.hashCode ^
      numr_tlfn_autre_assure.hashCode;
  }
}
