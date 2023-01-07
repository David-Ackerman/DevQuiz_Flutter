import 'dart:ffi';

import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({super.key, required this.quiz, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(AppImages.blocks),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(quiz.title, style: AppTextStyles.heading15),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "${quiz.questionAnswered} de ${quiz.questions.length}",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(
                    value: quiz.questionAnswered / quiz.questions.length),
              )
            ],
          )
        ]),
      ),
    );
  }
}
