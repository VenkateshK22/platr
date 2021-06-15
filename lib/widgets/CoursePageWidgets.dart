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
  //final link;
  const CourseCardBeginner({
    Key key,
    this.txt,
    this.url,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      height: MediaQuery.of(context).size.height / 9,
      decoration: BoxDecoration(
        //image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent,
            blurRadius: 8,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, QuizHome.id);
          _launchInBrowser(url);
        },
        child: Text(
          txt,
          style: kTextStyleCourseCard,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(20),
        ),
      ),
    );
  }
}

class CourseCardIntermediate extends StatelessWidget {
  final txt;
  final url;
  final image;
  //final link;
  const CourseCardIntermediate({
    Key key,
    this.txt,
    this.url,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      height: MediaQuery.of(context).size.height / 9,
      decoration: BoxDecoration(
        //image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent,
            blurRadius: 8,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, QuizHome.id);
          _launchInBrowser(url);
        },
        child: Text(
          txt,
          style: kTextStyleCourseCard,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(20),
        ),
      ),
    );
  }
}

class CourseCardAdvanced extends StatelessWidget {
  final txt;
  final url;

  //final link;
  const CourseCardAdvanced({
    Key key,
    this.txt,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      height: MediaQuery.of(context).size.height / 9,
      decoration: BoxDecoration(
        //image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent,
            blurRadius: 8,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, QuizHome.id);
          _launchInBrowser(url);
        },
        child: Text(
          txt,
          style: kTextStyleCourseCard,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(20),
        ),
      ),
    );
  }
}
