import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 247, 251),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(color: Color.fromARGB(255, 77, 91, 158)),
          SizedBox(height: 20),
          Text('Loading...',
              style: TextStyle(
                color: Color.fromARGB(255, 77, 91, 158),
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ))
        ]),
      ),
    );
  }
}
