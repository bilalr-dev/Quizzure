import 'package:flutter/material.dart';
import 'app_quizzure.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppQuizzure appQuizzure = AppQuizzure();

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Quizz'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: QuizzPage(),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> answerResults = [];
  int score = 0;

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appQuizzure.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        answerResults.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
        score++;
      } else {
        answerResults.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (appQuizzure.isFinished() == true) {
        Alert(
          context: context,
          title: "Quizz Finished.",
          desc: "You have answered all the questions.\nYour score is: $score",
          buttons: [
            DialogButton(
              child: Text(
                "Play again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              width: 120,
            )
          ],
        ).show();
        appQuizzure.reset();
        answerResults = [];
        score = 0;
      } else {
        appQuizzure.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResults,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                appQuizzure.getQuestionImage(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                appQuizzure.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
