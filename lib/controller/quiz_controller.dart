import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizController {
  Dio dio = Dio();

  Future<List<dynamic>> getQuizzes() async {
    try {
      Response response =
          await dio.get('https://opentdb.com/api.php?amount=5&type=multiple');
      List<Map<String, dynamic>> quizzes =
          List<Map<String, dynamic>>.from(response.data['results']);
      var unescape = HtmlUnescape();
      // Object data = response.data;
      // Map results = data.get('results');
      List<Map<String, dynamic>> results = [];
      for (dynamic quiz in quizzes) {
        List<String> answers = List<String>.from(quiz['incorrect_answers']);
        for (int i = 0; i < answers.length; i++) {
          answers[i] = unescape.convert(answers[i]);
        }
        answers.add(unescape.convert(quiz['correct_answer']));
        answers.shuffle();
        final int correctAnswer = answers.indexOf(unescape.convert(quiz['correct_answer']));
        results.add({
          'question': unescape.convert(quiz['question']),
          'answers': answers,
          'correctAnswer': correctAnswer,
        });
      }
      return results;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
