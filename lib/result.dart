import 'package:flutter/material.dart';


class  Result extends  StatelessWidget {
  final int resultScore;
  final Function resultQuizHandler;
  Result(this.resultScore,this.resultQuizHandler);

  String get resultPhrase{
    String resultText ;
    if(resultScore <= 8){
      resultText ='You are awesome';
    }
    else if(resultScore<=12){
      resultText= 'Pretty Likable';
    }
    else if (resultScore<=16){
      resultText='you are wierd';
    }
    else{
      resultText='You are so bad!';
    }

    return resultText;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
      Text(
        resultPhrase ,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
    ),
        FlatButton(
            textColor: Colors.blue,
            onPressed: resultQuizHandler, child: Text('Restart Quiz!'))],
      ),
    );
  }
}
