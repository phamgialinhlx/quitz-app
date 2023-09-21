import 'package:flutter/material.dart';
import 'package:quizzical/view/start_view.dart';
import 'package:quizzical/view/quiz_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'start',
      routes: {
        'start': (context) => const StartView(),
        'quiz': (context) => const QuizView(),
        // 'result': (context) => const ResultView(),
      },
    );
  }
}
