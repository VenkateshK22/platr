import 'package:flutter/material.dart';
import 'package:pla_tr/widgets/CoursePageWidgets.dart';

class IntermediateCoursePage extends StatefulWidget {
  static String id = 'intermediate_course_page';

  const IntermediateCoursePage({Key key}) : super(key: key);

  @override
  _IntermediateCoursePageState createState() => _IntermediateCoursePageState();
}

class _IntermediateCoursePageState extends State<IntermediateCoursePage> {
  // ignore: non_constant_identifier_names
  var CourseLang = <dynamic>[
    //TODO:1 change links and images allocate other assets if needed
    CourseInfo('C Programming', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('python', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('C++ Programming', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Objective C ', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('Java Programming', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('SQL Programming', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('HTML and CSS', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('JavaScript', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo('C# Programming', 'Image.asset("images/c.png")',
        'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo(
        'PHP ', 'Image.asset("images/c.png")', 'https://youtu.be/KJgsSFOSQv0'),
    CourseInfo(
        'Ruby ', 'Image.asset("images/c.png")', 'https://youtu.be/KJgsSFOSQv0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Intermediate Courses'),
        ),
        body: ListView.builder(
          itemCount: CourseLang.length,
          itemBuilder: (context, index) {
            return CourseCardIntermediate(
              txt: CourseLang[index].coursename,
              url: CourseLang[index].ytlink,
            );
          },
        ));
  }
}

class CourseInfo {
  final coursename;
  final icon;
  final ytlink;

  CourseInfo(this.coursename, this.icon, this.ytlink);
}
