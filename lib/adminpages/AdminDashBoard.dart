import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pla_tr/adminpages/AddCompanyDetails.dart';
import 'package:pla_tr/adminpages/StudentQueries.dart';
import 'package:pla_tr/adminpages/ViewStudentProfile.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/quiz/create_quiz_page.dart';
import 'package:pla_tr/services/auth.dart';

class AdminDashboard extends StatefulWidget {
  static String id = "Admin_Dash";
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: RichText(
              text: TextSpan(
                text: 'Admin Dash',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              tooltip: 'LogOut',
              onPressed: () {
                authService.SignOut();
                Navigator.popAndPushNamed(context, LoginPage.id);

                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('This is logout')));
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              AdminDashCard(
                nameofcard: "   Add Companies",
                colorarg: 2,
                route: CreateCompany.id,
                imagepath: "assets/images/companyadmin.png",
              ),
              AdminDashCard(
                nameofcard: "   Add Quiz Data",
                colorarg: 4,
                route: CreateQuiz.id,
                imagepath: "assets/images/quizadmin.png",
              ),
              AdminDashCard(
                nameofcard: "   Students Profiles",
                colorarg: 6,
                route: StudentProfileViewA.id,
                imagepath: "assets/images/studentadmin.png",
              ),
              AdminDashCard(
                nameofcard: "   Students Queries",
                colorarg: 6,
                route: StudentQueries.id,
                imagepath: "assets/images/query.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminDashCard extends StatelessWidget {
  final String nameofcard;
  final colorarg;
  final route;
  final imagepath;

  const AdminDashCard(
      {Key key, this.nameofcard, this.colorarg, this.route, this.imagepath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List color = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
    ];
    color.shuffle();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color[colorarg]),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(2),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4.6,
        child: Center(
          child: Row(
            children: [
              Image.asset(
                imagepath,
                height: 100,
                width: 100,
              ),
              Text(
                nameofcard,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
