import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/qustions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.onRestart,
    required this.chosenAnswers,
    super.key,
  });

  final void Function() onRestart;

  //Here we define a list of chosen answers

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    //.where(() {}) allows the developer to filter the list on which your calling it
    //.where(() {}) just like map does not the change the original list
    final numCorrectAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(color: Colors.blue),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$numCorrectAnswers out $numTotalQuestions answered correctly',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                )),
            const SizedBox(height: 10),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
