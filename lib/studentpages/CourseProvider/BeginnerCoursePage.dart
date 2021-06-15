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
    //TODO:1 change links  allocate other assets if needed
    CourseInfo('C Programming', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Python', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('C++ Programming', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Objective C ', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Java Programming', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('SQL Programming', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('HTML and CSS', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('JavaScript', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('C# Programming', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('PHP ', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Ruby ', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('PERL ', 'https://youtu.be/KJgsSFOSQv0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Beginner Courses'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            CourseLangBeginner.length,
            (index) {
              return CourseCardBeginner(
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
