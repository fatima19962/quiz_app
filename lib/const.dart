import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/question_model.dart';

const backgroundColor = Color.fromRGBO(45, 27, 3, 1);
const foregroundColor = Color.fromRGBO(244, 140, 6, 1);

List<QuizQuestionModel> quizQuestions = [
  QuizQuestionModel(
    question: "this is Original Question",
    correctAnswer: "1",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),
  QuizQuestionModel(
    question: "this is Original Question",
    correctAnswer: "2",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),
  QuizQuestionModel(
    question: "this is Original Question",
    correctAnswer: "3",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),
  QuizQuestionModel(
    question: "this is Original Question",
    correctAnswer: "4",
    options: [
      "1",
      "2",
      "3",
      "4",
    ],
  ),
];
