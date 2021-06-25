import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What\'s your favorite  color ?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 7},
        {"text": "Green", "score": 5},
        {"text": "Grey", "score": 3},
        {"text": "silver", "score": 1},
      ],
    },
    {
      "questionText": "What\'s your favorite animal ?",
      'answers': [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 2},
        {"text": "Dear", "score": 6},
        {"text": "Rabbit", "score": 7},
        {"text": "Lion", "score": 8},
      ],
    },
    {
      "questionText": "What\'s your favorite language ?",
      "answers": [
        {"text": "JavaScript", "score": 10},
        {"text": "Java", "score": 1},
        {"text": "Flutter", "score": 9},
        {"text": "React", "score": 7},
        {"text": "Python", "score": 6},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = false;
    // aBool = true;

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more question !');
    } else {
      print('No more question !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('My First App'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
