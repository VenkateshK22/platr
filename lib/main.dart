import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/adminpages/AddCompanyDetails.dart';
import 'package:pla_tr/companypages/ApplyCompany.dart';
import 'package:pla_tr/companypages/companyDifficulty.dart';
import 'package:pla_tr/quiz/QuizHome.dart';
import 'package:pla_tr/quiz/ResultsPage.dart';
import 'package:pla_tr/quiz/addQuestion.dart';
import 'package:pla_tr/companypages/CompanyList.dart';
import 'package:pla_tr/studentpages/CourseProvider/AdvancedCoursePage.dart';
import 'package:pla_tr/studentpages/CourseProvider/BeginnerCoursePage.dart';
import 'package:pla_tr/studentpages/CourseProvider/CoursePageHome.dart';
import 'package:pla_tr/studentpages/CourseProvider/IntermediateCoursePage.dart';
import 'package:pla_tr/studentpages/StudentDashBoard.dart';
import 'package:pla_tr/studentpages/StudentDetails.dart';
import 'authUI/SignupPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PlaTr());
}

class PlaTr extends StatefulWidget {
  @override
  _PlaTrState createState() => _PlaTrState();
}

class _PlaTrState extends State<PlaTr> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      title: 'PLa-Tr',
      routes: {
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        CoursePage.id: (context) => CoursePage(),
        BeginnerCoursePage.id: (context) => BeginnerCoursePage(),
        IntermediateCoursePage.id: (context) => IntermediateCoursePage(),
        AdvancedCoursePage.id: (context) => AdvancedCoursePage(),
        QuizHome.id: (context) => QuizHome(),
        AddQuestion.id: (context) => AddQuestion(),
        ResultPage.id: (context) => ResultPage(),
        CompanyList.id: (context) => CompanyList(),
        CreateCompany.id: (context) => CreateCompany(),
        StudentDash.id: (context) => StudentDash(),
        StudentDetails.id: (context) => StudentDetails(),
        CompanyDifficulty.id: (context) => CompanyDifficulty(),
        ApplyCompany.id: (context) => ApplyCompany(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
