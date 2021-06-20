import 'package:flutter/material.dart';
import 'package:pla_tr/Constants.dart';
import 'package:pla_tr/quiz/QuizHome.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchInBrowser(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print(e);
  }
}

class CourseCardBeginner extends StatelessWidget {
  final txt;
  final url;
  final image;
  final color;
  final acccolor;
  //final link;
  const CourseCardBeginner({
    Key key,
    this.txt,
    this.url,
    this.image,
    this.color,
    this.acccolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String level = "BegQuizData";
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      height: MediaQuery.of(context).size.height / 9,
      decoration: BoxDecoration(
        //image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            colors: [color, acccolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizHome(level: level),
            ),
          );
          _launchInBrowser(url);
        },
        child: Text(
          txt,
          style: kTextStyleCourseCard,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(20),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => color), //!!cardcolor
        ),
      ),
    );
  }
}

class CourseCardIntermediate extends StatelessWidget {
  final txt;
  final url;
  final image;
  final color;
  final acccolor;
  //final link;
  const CourseCardIntermediate({
    Key key,
    this.txt,
    this.url,
    this.image,
    this.color,
    this.acccolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String level = "InterQuizData";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizHome(level: level),
          ),
        );
        _launchInBrowser(url);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          //image: DecorationImage(image: AssetImage(image)),
          borderRadius: BorderRadius.circular(15),
          color: color,
          gradient: LinearGradient(
              colors: [color, acccolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          // boxShadow: [
          //   BoxShadow(
          //     color: acccolor,
          //     blurRadius: 8,
          //     offset: Offset(0, 6),
          //   ),
          // ],
        ),
        child: Center(
          child: Text(
            txt,
            style: kTextStyleCourseCard,
          ),
        ),
      ),
    );
  }
}

class CourseCardAdvanced extends StatelessWidget {
  final txt;
  final url;
  final color;
  final acccolor;

  //final link;
  const CourseCardAdvanced({
    Key key,
    this.txt,
    this.url,
    this.color,
    this.acccolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String level = "AdvQuizData";
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizHome(level: level),
          ),
        );
        _launchInBrowser(url);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          //image: DecorationImage(image: AssetImage(image)),
          borderRadius: BorderRadius.circular(25),
          color: color,
          gradient: LinearGradient(
              colors: [color, acccolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: Text(
            txt,
            style: kTextStyleCourseCard,
          ),
        ),
      ),
    );
  }
}
