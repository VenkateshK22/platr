import 'package:flutter/material.dart';
import 'package:pla_tr/studentpages/CourseProvider/CoursePageHome.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class FAiledtoScore extends StatefulWidget {
  @override
  _FAiledtoScoreState createState() => _FAiledtoScoreState();
}

class _FAiledtoScoreState extends State<FAiledtoScore> {
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
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: ClipRRect(
                  child: Image.asset("assets/images/clipboard.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    " You've Failed the Test Successfully!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Center(
                  child: Text(
                    "Improve Your skills and Apply For Companies",
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
                            (states) => Colors.red)),
                    onPressed: () {
                      Navigator.pushNamed(context, CoursePage.id);
                    },
                    child: Text(
                      "Go Back To Dash",
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
