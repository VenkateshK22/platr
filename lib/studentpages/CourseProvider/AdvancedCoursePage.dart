import 'package:flutter/material.dart';
import 'package:pla_tr/widgets/CoursePageWidgets.dart';

class AdvancedCoursePage extends StatefulWidget {
  static String id = 'advanced_course_page';

  const AdvancedCoursePage({Key key}) : super(key: key);

  @override
  _AdvancedCoursePageState createState() => _AdvancedCoursePageState();
}

class _AdvancedCoursePageState extends State<AdvancedCoursePage> {
  // ignore: non_constant_identifier_names
  var CourseLang = <dynamic>[
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
          title: Text('Advanced Courses'),
        ),
        body: ListView.builder(
          itemCount: CourseLang.length,
          itemBuilder: (context, index) {
            return CourseCardAdvanced(
              txt: CourseLang[index].coursename,
              url: CourseLang[index].ytlink,
            );
          },
        ));
  }
}

class CourseInfo {
  final coursename;

  final ytlink;

  CourseInfo(this.coursename, this.ytlink);
}
