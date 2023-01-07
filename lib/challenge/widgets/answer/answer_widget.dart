import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget(
      {super.key,
      required this.answer,
      this.isSelected = false,
      this.disabled = false,
      required this.onTap});

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.body;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(answer.isRight);
          },
          child: Container(
            padding: const EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                isSelected
                    ? Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: _selectedColorRight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.fromBorderSide(BorderSide(
                              color: isSelected
                                  ? _selectedBorderRight
                                  : AppColors.border)),
                        ),
                        child: Icon(
                          _selectedIconRight,
                          size: 16,
                          color: Colors.white,
                        ))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
