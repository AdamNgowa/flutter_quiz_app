import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_screen.dart';
import 'package:quiz_app/widgets/result_screen.dart';
import 'package:quiz_app/widgets/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Initially the the first screen to be displayed is the StartScreen
  var activeScreen = 'start-screen';
  //This variable stores the list of selected answers
  List<String> selectedAnswers = [];

  //This method allows for switching screens
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

//Adds items to the list of selected answers
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenChanger = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenChanger = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenChanger = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: screenChanger,
        ),
      ),
    );
  }
}
