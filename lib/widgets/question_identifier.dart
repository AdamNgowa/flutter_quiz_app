import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    required this.questionIndex,
    required this.isCorrectAnswer,
    super.key,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer
              ? const Color.fromARGB(255, 8, 245, 15)
              : Color.fromARGB(255, 223, 131, 11),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
