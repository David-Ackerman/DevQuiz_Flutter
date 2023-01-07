import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final UserModel user;
  AppBarWidget({required this.user});

  @override
  Size get preferredSize => Size.fromHeight(250);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Container(
              height: 161,
              decoration: BoxDecoration(gradient: AppGradients.linear),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                        text: 'Olá ',
                        style: AppTextStyles.title,
                        children: [
                          TextSpan(
                            text: user.name,
                            style: AppTextStyles.titleBold,
                          ),
                        ])),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(user.photoURL),
                        ),
                      ),
                    )
                  ]),
            ),
            Align(
                alignment: const Alignment(0, 1),
                child: ScoreCardWidget(
                  percent: user.score / 100,
                ))
          ],
        ),
      ),
    );
  }
}
