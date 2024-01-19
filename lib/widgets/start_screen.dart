import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
        child: Column(
          children: [
            const SizedBox(height: 80),
            //Quiz logo immage
            Image.asset(
              'assets/images/quiz-logo.png',
              color: const Color.fromARGB(211, 255, 255, 255),
            ),
            //Spacer
            const SizedBox(height: 40),
            //Text
            const Text(
              'Learn flutter the fun way!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            //Spacer
            const SizedBox(height: 40),
            //Start Quiz button
            //function
            ElevatedButton.icon(
              onPressed: startQuiz,
              //styling the button
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              //button text
              label: const Text(
                'Start Quiz',
              ),
              icon: const Icon(Icons.arrow_right_alt_rounded),
            )
          ],
        ),
      ),
    );
  }
}
