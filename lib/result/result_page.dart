import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String quizTitle;
  final int rightAnswered;
  final int totalQuestions;
  const ResultPage(
      {super.key,
      required this.quizTitle,
      this.rightAnswered = 1,
      this.totalQuestions = 10});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 68),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text(
                    'Parabéns!',
                    style: AppTextStyles.heading40,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Você concluiu",
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                            text: '\n$quizTitle\n',
                            style: AppTextStyles.bodyBold,
                          ),
                          TextSpan(
                            text:
                                "com $rightAnswered de $totalQuestions acerto(s).",
                            style: AppTextStyles.body,
                          ),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: NextButtonWidget.share(
                              label: 'Compartilhar',
                              onTap: () {
                                Share.share(
                                    'DevQuiz NLW5 - Flutter: Resultado do Quizz: $quizTitle \nObtive ${rightAnswered / totalQuestions}% de aproveitamento.');
                              })),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.outline(
                            label: 'Voltar ao início',
                            noBorder: true,
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
