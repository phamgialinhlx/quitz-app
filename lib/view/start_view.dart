import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 251),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Quizzical',
            style: TextStyle(
                fontFamily: 'Karla',
                fontSize: 31.25,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 41, 50, 100)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Let\'s get quizzical!',
            style: TextStyle(
                fontFamily: 'Karla',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 41, 50, 100)),
          ),
          const SizedBox(height: 29),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'quiz');
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 77, 91, 158),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 52,
              width: 193,
              alignment: Alignment.center,
              child: const Text("Start quiz",
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 16, color: Colors.white)),
            ),
          )
        ],
      )),
    );
  }
}
