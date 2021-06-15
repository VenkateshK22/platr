import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pla_tr/studentpages/CourseProvider/AdvancedCoursePage.dart';
import 'package:pla_tr/studentpages/CourseProvider/IntermediateCoursePage.dart';
import '../../Constants.dart';
import 'BeginnerCoursePage.dart';

class CoursePage extends StatefulWidget {
  static String id = 'course_page_home';
  const CoursePage({Key key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Course Difficulty",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CourseCardBIA(
                  titleCard: Text(
                    "Beginner",
                    style: kTextStyleCourseCardBIA,
                  ),
                  color: Color(0xFF57D4FA),
                  onpress: () {
                    Navigator.pushNamed(context, BeginnerCoursePage.id);
                  },
                ),
                CourseCardBIA(
                  titleCard: Text(
                    "Intermediate",
                    style: kTextStyleCourseCardBIA,
                  ),
                  color: Color(0xff4895ef),
                  onpress: () {
                    Navigator.pushNamed(context, IntermediateCoursePage.id);
                  },
                ),
                CourseCardBIA(
                  titleCard: Text(
                    "Advanced",
                    style: kTextStyleCourseCardBIA,
                  ),
                  color: Color(0xff3f37c9),
                  onpress: () {
                    Navigator.pushNamed(context, AdvancedCoursePage.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseCardBIA extends StatelessWidget {
  final Text titleCard;
  final Color color;
  final Function onpress;
  const CourseCardBIA({Key key, this.titleCard, this.color, this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpress,
        child: titleCard,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
