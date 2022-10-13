import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 10},
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 2},
        {'text': 'Cow', 'score': 3},
        {'text': 'Snake', 'score': 10},
      ],
    },
    {
      'questionText': "Who's your favorite instructor?",
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Hugo', 'score': 3},
        {'text': 'Jorge', 'score': 5},
        {'text': 'Matilda', 'score': 1},
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
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
