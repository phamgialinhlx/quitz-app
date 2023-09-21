import 'package:flutter/material.dart';
import 'package:quizzical/view/quiz_view.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.quizzes}) : super(key: key);
  final List<Quiz> quizzes;

  int getScore() {
    int score = 0;
    for (Quiz quiz in quizzes) {
      if (quiz.selectedAnswer == quiz.correctAnswer) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your scored ${getScore()}/5 correct answers!",
              style: const TextStyle(
                color: Color.fromARGB(255, 77, 91, 158),
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'start');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 77, 91, 158),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 52,
                width: 193,
                alignment: Alignment.center,
                child: const Text("Play again",
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 16, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
