import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/question_model.dart';
import 'package:quiz_app/result_screen.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  final PageController pageController = PageController();
  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = "", selectedAnswer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: backgroundColor),
        backgroundColor: foregroundColor,
        centerTitle: true,
        title: Text(
          "Play Quiz",
          style: TextStyle(color: backgroundColor),
        ),
      ),
      body: PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: quizQuestions.length,
          itemBuilder: (context, index) {
            QuizQuestionModel model = quizQuestions[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.question,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      children: List.generate(
                    // 4,
                    model.options.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isAnswerLocked = true;
                            selectedAnswer = model.options[index];
                            correctAnswer = model.correctAnswer;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: foregroundColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: selectedAnswer == model.options[index]
                                ? foregroundColor
                                : backgroundColor,
                          ),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(14),
                          child: Text(
                            model.options[index],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            );
          }),
      bottomNavigationBar: InkWell(
        onTap: () {
          // print("Tapped");
          if (isAnswerLocked) {
            if (selectedAnswer == correctAnswer) {
              correctAnswers++;
            } else {
              wrongAnswers++;
            }

            currentIndex++;

            if (currentIndex != quizQuestions.length) {
              selectedAnswer = "";
              pageController.jumpToPage(currentIndex);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    correctAnswers: correctAnswers,
                    wrongAnswers: wrongAnswers,
                  ),
                ),
              );
            }
            // pageController.jumpToPage(currentIndex);
            print("Correct Answers: $correctAnswers");
            print("Wrong Answers: $wrongAnswers");
          } else {
            print("PLease select an option");
          }
        },
        child: Container(
          height: 70,
          color: foregroundColor,
          alignment: Alignment.center,
          child: Text(
            "Next",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: backgroundColor),
          ),
        ),
      ),
    );
  }
}
