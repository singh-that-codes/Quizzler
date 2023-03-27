import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'brain.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Icon> scoreKeeper = [];
  brain obj = new brain();

  bool crans,currans;

  void Check(bool x) {
    x=currans;
    if(x==true){
      if (crans == true) {
        print('right');
        scoreKeeper.add(
            Icon(Icons.check,
              color: Colors.green,)
        );
      }
      else {
        print('wrong');
        scoreKeeper.add(
            Icon(Icons.close,
              color: Colors.red,)
        );
      }
    }
    else{
      if (crans == true) {
        print('wrong');
        scoreKeeper.add(
            Icon(Icons.close,
              color: Colors.red,)
        );
      }
      else {
        print('right');
        scoreKeeper.add(
            Icon(Icons.check,
              color: Colors.green,)
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                obj.getQuesTxt(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
            style: TextButton.styleFrom(
            foregroundColor: Colors.blueGrey,
            backgroundColor: Colors.green,
            ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  obj.NextQues();
                  crans=obj.getCrans();
                  Check(crans);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blueGrey,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  crans=obj.getCrans();
                  obj.NextQues();
                  Check(crans);

                });

              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
