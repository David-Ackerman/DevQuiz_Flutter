// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { easy, medium, hard, expert }

extension LevelStringExt on String {
  Level get levelParse => {
        'easy': Level.easy,
        'medium': Level.medium,
        'hard': Level.hard,
        'expert': Level.expert
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.easy: 'easy',
        Level.medium: 'medium',
        Level.hard: 'hard',
        Level.expert: 'expert',
      }[this]!;
}

class QuizModel {
  final String title;

  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'] as String,
      questions: List<QuestionModel>.from(
        (map['questions']).map<QuestionModel>(
          (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      questionAnswered: map['questionAnswered'] as int,
      image: map['image'] as String,
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
