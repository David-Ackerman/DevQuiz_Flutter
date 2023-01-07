// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dev_quiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'] as String,
      answers: List<AnswerModel>.from(
        (map['answers']).map<AnswerModel>(
          (x) => AnswerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
