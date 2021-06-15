import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pla_tr/quiz/Quiz_Play.dart';
import 'package:pla_tr/companypages/CompanyList.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class ResultPage extends StatefulWidget {
  static String id = 'Result_Page';
  final total;
  final correct;
  final incorrect;

  const ResultPage({Key key, this.correct, this.incorrect, this.total})
      : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
      ),
      body: Container(
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.black,
                child: ClipRRect(
                  child: Image.asset("assets/images/correct.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    "Congrats You've Finished the Test!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
              Container(
                  child: Center(
                child: Text(
                  "Out Of $total Questions\n\n You got $correct Correct ",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              )),
              Spacer(),
              Container(
                child: Center(
                  child: Text(
                    "Apply for companies with your learned skills",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: 80,
                child: OutlinedButton(
                    style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 0.0),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.blue)),
                    onPressed: () {
                      Navigator.pushNamed(context, CompanyList.id);
                    },
                    child: Text(
                      "Apply for Companies",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
