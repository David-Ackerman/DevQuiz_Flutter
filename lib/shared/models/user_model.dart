// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String photoURL;
  final int score;

  UserModel({
    required this.name,
    required this.photoURL,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'photoURL': photoURL,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      photoURL: map['photoURL'] as String,
      score: map['score'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
