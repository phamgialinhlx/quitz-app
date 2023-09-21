import 'package:flutter/material.dart';
import 'package:quizzical/controller/quiz_controller.dart';
import 'package:quizzical/view/loading_view.dart';
import 'package:quizzical/view/result_view.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<Quiz> quizzes = [];
  QuizController quizController = QuizController();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadQuizzes();
  }

  void loadQuizzes() async {
    List<dynamic> data = await quizController.getQuizzes();
    setState(() {
      quizzes = data
          .map((item) => Quiz(
                item['question'],
                item['answers'],
                item['correctAnswer'],
              ))
          .toList();
      loading = false;
    });
  }

  Widget createQuiz(index) {
    return Column(
      children: [
        Text(
          quizzes[index].question,
          style: const TextStyle(
            fontFamily: 'Karla',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        // show quizzes answer
        ...quizzes[index]
            .answers
            .map((answer) => Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      quizzes[index].selectedAnswer =
                          quizzes[index].answers.indexOf(answer);
                    });
                  },
                  child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: (quizzes[index].answers.indexOf(answer) !=
                              quizzes[index].selectedAnswer)
                          ? BoxDecoration(
                              // color: Color.fromARGB(255, 214, 219, 245),
                              borderRadius: BorderRadius.circular(7.942),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 77, 91, 158)),
                            )
                          : BoxDecoration(
                              color: const Color.fromARGB(255, 214, 219, 245),
                              borderRadius: BorderRadius.circular(7.942),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 214, 219, 245)),
                            ),
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            answer,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ))),
                )))
            .toList(),
        const Divider(
          thickness: 0.794,
          // width: MediaQuery.sizeOf(context).width,
          color: Color.fromARGB(255, 219, 222, 240),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const LoadingView()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 245, 247, 251),
            body: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext insContext, int index) {
                        return createQuiz(index);
                      },
                      itemCount: quizzes.length,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultView(
                            quizzes: quizzes,
                          ),
                        ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 77, 91, 158),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 42,
                      width: 120,
                      alignment: Alignment.center,
                      child: const Text("Done",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  )
                ],
              ),
            ));
  }
}

class Quiz {
  final String question;
  final List<String> answers;
  final int correctAnswer;
  int selectedAnswer = -1;
  Quiz(
    this.question,
    this.answers,
    this.correctAnswer,
  );
}
