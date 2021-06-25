import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final VoidCallback resetHandler;

  const Result({
    Key? key,
    required this.resultScore,
    required this.resetHandler,
  }) : super(key: key);

  String get resultPhase {
    var resultText;
    if (resultScore <= 12) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 15) {
      resultText = 'You are Pretty likable!!';
    } else if (resultScore <= 18) {
      resultText = 'You are Strange!';
    } else {
      resultText = 'You are a bad Person !!!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz',
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
