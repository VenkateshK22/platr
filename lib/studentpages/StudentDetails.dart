import 'package:flutter/material.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class StudentDetails extends StatefulWidget {
  static String id = "Student_Details_Page";
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
      ),
    );
  }
}
