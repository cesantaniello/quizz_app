import 'package:flutter/material.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() => setState(() => activeScreen = 'questions-screen');
  void chooseAnswer(String answer) {
    selectedAswers.add(answer);
    if (selectedAswers.length == questions.length) {
      setState(() {
        selectedAswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(onSelectedAnswer: chooseAnswer);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
