import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
void main(){
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>
{
  final _questions = const [
    {'questionText' : 'What\'s your favorite animal?' ,
      'answers': [{'text':'Rabbit', 'score': 2},
        {'text':'Bear' , 'score': 4},
        {'text' : 'Squirrel', 'score':3},
        {'text':'Dog', 'score': 5}],
    },
    {'questionText': 'What\'s your favorite colour?',
      'answers':[{'text':'Red','score':5},
        {'text':'black','score':4} ,
        {'text':'Blue','score':3},
        {'text':'Green','score':2}],
    },
    {'questionText':'What\'s your favorite movie?',
      'answers':[{'text':'a','score':1},
        {'text':'b','score':2},
        {'text':'c','score':3},
        {'text':'d','score':4}],
    },

  ];


//const is compile time constant....whereas if we write final that means it is just runtime constant


  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;

    });

  }

    void _answerQuestion(int score) {
      _totalScore += score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);

      if(_questionIndex < _questions.length){
        print('We have more questions!');
      }
      else{
        print('No more Questions');
      }


    }
  @override
  Widget build(BuildContext context) {

  // TODO: implement build
  return MaterialApp(home: Scaffold(
    appBar: AppBar(title: Text('Flutter App')),
    body: _questionIndex < _questions.length
        ?Quiz(answerQuestion: _answerQuestion, questionIndex:_questionIndex, questions: _questions)
        :Result(_totalScore, _resetQuiz),
  ),
  );
}}


