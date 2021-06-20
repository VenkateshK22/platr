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
    //done-TODO:1 change links and images allocate other assets if needed
    CourseInfo('Web Developer 1 \nMongo DB',
        'https://www.youtube.com/watch?v=-56x56UppqQ'),
    CourseInfo('Web Developer 2 \nAngular JS',
        'https://www.youtube.com/watch?v=k5E2AVpwsko'),
    CourseInfo('Web Developer 3 \nNode JS',
        'https://www.youtube.com/watch?v=TlB_eWDSMt4'),
    CourseInfo('Web Developer 4 \nReact JS ',
        'https://www.youtube.com/watch?v=w7ejDZ8SWv8'),
    CourseInfo('Mobile App Developer 1 \nJava ',
        'https://www.youtube.com/watch?v=fis26HvvDII'),
    CourseInfo('Mobile App Developer 2 \n Kotlin',
        'https://www.youtube.com/watch?v=IoeezAe-8IQ&list=PLaoF-xhnnrRUEbF6cvk4-CeBAEOSbp8sS'),
    CourseInfo('Mobile App Developer 3  \n Swift',
        'https://www.youtube.com/watch?v=HXoVSbwWUIk'),
    CourseInfo('Mobile App Developer 4  \n Flutter & Dart',
        'https://www.youtube.com/watch?v=x0uinJvhNxI&t=3915s'),
    CourseInfo('Desktop App Developer \nSpring Boot  ',
        'https://www.youtube.com/watch?v=9SGDpanrc8U'),
    CourseInfo('Desktop App Developer \n .NET ',
        'https://www.youtube.com/watch?v=uc3tC6_mEvk'),
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
      Colors.brown,
      Colors.blueGrey,
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
          backgroundColor: color[2],
          title: Text('Intermediate Courses'),
        ),
        body: ListView.builder(
          itemCount: CourseLang.length,
          itemBuilder: (context, index) {
            return CourseCardIntermediate(
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
