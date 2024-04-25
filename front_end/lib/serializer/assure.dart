// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class assure {
  int numr_tlfn;
  String first_name;
  String last_name;
  String email_user;
  int num_permis;
  assure({
    required this.numr_tlfn,
    required this.first_name,
    required this.last_name,
    required this.email_user,
    required this.num_permis,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numr_tlfn': numr_tlfn,
      'first_name': first_name,
      'last_name': last_name,
      'email_user': email_user,
      'num_permis': num_permis,
    };
  }

  factory assure.fromMap(Map<String, dynamic> map) {
    return assure(
      numr_tlfn: map['numr_tlfn'] as int,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      email_user: map['email_user'] as String,
      num_permis: map['num_permis'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory assure.fromJson(String source) => assure.fromMap(json.decode(source) as Map<String, dynamic>);
  factory assure.fromJson2(Map<String, dynamic> json) {
  return assure(
    numr_tlfn: json['numr_tlfn'] ?? 0,
    first_name: json['first_name'] ?? '',
    last_name: json['last_name'] ?? '',
    email_user: json['email_user'] ?? '',
    num_permis: json['num_permis'] ?? 0,
  );
}

  @override
  String toString() {
    return 'assure(numr_tlfn: $numr_tlfn, first_name: $first_name, last_name: $last_name, email_user: $email_user, num_permis: $num_permis';
  }

  @override
  bool operator ==(covariant assure other) {
    if (identical(this, other)) return true;
  
    return 
      other.numr_tlfn == numr_tlfn &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email_user == email_user &&
      other.num_permis == num_permis ;
  }

  @override
  int get hashCode {
    return numr_tlfn.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email_user.hashCode ^
      num_permis.hashCode ;
  }
}
