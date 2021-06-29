import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pla_tr/adminpages/AdminDashBoard.dart';
import 'package:pla_tr/adminpages/ViewStudentProfile.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/adminpages/AddCompanyDetails.dart';
import 'package:pla_tr/companypages/AdvCompanyList.dart';
import 'package:pla_tr/companypages/AppliedCompList.dart';
import 'package:pla_tr/companypages/ApplyCompany.dart';
import 'package:pla_tr/companypages/CompanyDashBoard.dart';
import 'package:pla_tr/companypages/InterCompanyList.dart';
import 'package:pla_tr/companypages/companyDifficulty.dart';
import 'package:pla_tr/quiz/QuizHome.dart';
import 'package:pla_tr/quiz/ResultsPage.dart';
import 'package:pla_tr/quiz/addQuestion.dart';
import 'package:pla_tr/companypages/CompanyList.dart';
import 'package:pla_tr/quiz/create_quiz_page.dart';
import 'package:pla_tr/services/forgotpass.dart';
import 'package:pla_tr/services/helpersharedref.dart';
import 'package:pla_tr/studentpages/CourseProvider/AdvancedCoursePage.dart';
import 'package:pla_tr/studentpages/CourseProvider/BeginnerCoursePage.dart';
import 'package:pla_tr/studentpages/CourseProvider/CoursePageHome.dart';
import 'package:pla_tr/studentpages/CourseProvider/IntermediateCoursePage.dart';
import 'package:pla_tr/studentpages/StudentDashBoard.dart';
import 'package:pla_tr/studentpages/StudentDetails.dart';
import 'package:pla_tr/studentpages/editstudentdetails.dart';
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
  bool isLoggedin = false;
  initState() {
    super.initState();
  }

  checkUSERLoginStatus() async {
    await HelperFunction.getUserLoginDetails();
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
        AdvCompanyList.id: (context) => AdvCompanyList(),
        InterCompanyList.id: (context) => InterCompanyList(),
        CompanyList.id: (context) => CompanyList(),
        CreateCompany.id: (context) => CreateCompany(),
        StudentDash.id: (context) => StudentDash(),
        StudentDetails.id: (context) => StudentDetails(),
        CompanyDifficulty.id: (context) => CompanyDifficulty(),
        ApplyCompany.id: (context) => ApplyCompany(),
        EditStdDetails.id: (context) => EditStdDetails(),
        AdminDashboard.id: (context) => AdminDashboard(),
        CreateQuiz.id: (context) => CreateQuiz(),
        StudentProfileViewA.id: (context) => StudentProfileViewA(),
        StudentProfileViewCompany.id: (context) => StudentProfileViewCompany(),
        AppliedCompanyList.id: (context) => AppliedCompanyList(),
        ForgotPassword.id: (context) => ForgotPassword(),
      },
      home: LoginPage(),
      //home: ((isLoggedin ?? false) ? StudentDash() : LoginPage()),
    );
  }
}
