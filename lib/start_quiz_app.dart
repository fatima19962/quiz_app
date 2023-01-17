import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/play_quiz_screen.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Start Quiz"),
        centerTitle: true,
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Quiz App",
              style: TextStyle(
                color: foregroundColor,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // print("Sucess");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlayQuizScreen()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: foregroundColor),
              child: Text(
                "Start Quiz",
                style: TextStyle(color: backgroundColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
