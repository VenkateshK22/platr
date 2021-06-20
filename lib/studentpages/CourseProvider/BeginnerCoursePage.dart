import 'package:flutter/material.dart';
import 'package:pla_tr/widgets/CoursePageWidgets.dart';

class BeginnerCoursePage extends StatefulWidget {
  static String id = 'Beginner_course_page';

  const BeginnerCoursePage({Key key}) : super(key: key);

  @override
  _BeginnerCoursePageState createState() => _BeginnerCoursePageState();
}

class _BeginnerCoursePageState extends State<BeginnerCoursePage> {
  // ignore: non_constant_identifier_names
  var CourseLangBeginner = <dynamic>[
    //done-TODO:1 change links  allocate other assets if needed
    CourseInfo('C Programming', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Python', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc'),
    CourseInfo(
        'C++ Programming', 'https://www.youtube.com/watch?v=vLnPwxZdW4Y'),
    CourseInfo('Objective C ', 'https://www.youtube.com/watch?v=5esQqZIJ83g'),
    CourseInfo(
        'Java Programming', 'https://www.youtube.com/watch?v=eIrMbAQSU34'),
    CourseInfo(
        'SQL Programming', 'https://www.youtube.com/watch?v=HXV3zeQKqGY'),
    CourseInfo(
        'HTML 5 and \nCSS', 'https://www.youtube.com/watch?v=D-h8L5hgW-w'),
    CourseInfo('JavaScript', 'https://www.youtube.com/watch?v=PkZNo7MFNFg'),
    CourseInfo(
        'C# \nProgramming', 'https://www.youtube.com/watch?v=gfkTfcpWqAY'),
    CourseInfo('PHP ', 'https://www.youtube.com/watch?v=OK_JCtrrv-c'),
  ];

  @override
  Widget build(BuildContext context) {
    List color = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
    ];

    List acccolor = Colors.accents;
    color.shuffle();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color[4],
          title: Text('Beginner Courses'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            CourseLangBeginner.length,
            (index) {
              return CourseCardBeginner(
                acccolor: acccolor[index],
                color: color[index],
                txt: CourseLangBeginner[index].coursename,
                url: CourseLangBeginner[index].ytlink,
              );
            },
          ),
        ));
  }
}

class CourseInfo {
  final coursename;
  final ytlink;

  CourseInfo(this.coursename, this.ytlink);
}
