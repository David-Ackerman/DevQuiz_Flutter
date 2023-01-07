import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionIndicatorWidget(
      {super.key, required this.currentPage, required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Questão $currentPage',
              style: AppTextStyles.body,
            ),
            Text(
              'de $length',
              style: AppTextStyles.body,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ProgressIndicatorWidget(value: currentPage / length)
      ]),
    );
  }
}
