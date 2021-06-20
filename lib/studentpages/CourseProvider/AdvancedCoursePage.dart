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
    //done-TODO:1 change links  allocate other assets if needed
    CourseInfo('Amazon Web Services \nLearn Basics For\nBeginners ',
        'https://www.youtube.com/watch?v=ulprqHHWlng'),
    CourseInfo('Cloud Computing \nFor Beginners',
        'https://www.youtube.com/watch?v=2LaAJq1lB1Q'),
    CourseInfo('Data Science \nFor Beginners ',
        'https://www.youtube.com/watch?v=-ETQ97mXXF0'),
    CourseInfo('Dev Operations \nFull Course \nFor Beginners ',
        'https://www.youtube.com/watch?v=hQcFE0RD0cQ'),
    CourseInfo('Machine Learing w/ \nPython \nFor Beginners',
        'https://www.youtube.com/watch?v=7eh4d6sabA0'),
    CourseInfo('Neural Networking\n For Beginners',
        'https://www.youtube.com/watch?v=ob1yS9g-Zcs'),
    CourseInfo('Full Stack \nWeb Developer \nM E R N stack',
        'https://www.youtube.com/watch?v=mrHNSanmqQ4'),
    CourseInfo('Full Stack \nMobile App Developer \nFlutter & Firebase',
        'https://www.youtube.com/watch?v=j-LOab_PzzU&t=1454s'),
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

    List acccolor = [
      Colors.redAccent,
      Colors.pinkAccent,
      Colors.purpleAccent,
      Colors.deepPurpleAccent,
      Colors.indigoAccent,
      Colors.blueAccent,
      Colors.lightBlueAccent,
      Colors.cyanAccent,
      Colors.tealAccent,
      Colors.greenAccent,
      Colors.lightGreenAccent,
      Colors.limeAccent,
      Colors.yellowAccent,
      Colors.amberAccent,
      Colors.orangeAccent,
      Colors.deepOrangeAccent,
    ];
    color.shuffle();
    acccolor.shuffle();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color[1],
          title: Text('Advanced Courses'),
        ),
        body: ListView.builder(
          itemCount: CourseLang.length,
          itemBuilder: (context, index) {
            return CourseCardAdvanced(
              color: color[index],
              acccolor: acccolor[index],
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
