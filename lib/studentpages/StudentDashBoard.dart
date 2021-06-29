import 'package:flutter/material.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/companypages/companyDifficulty.dart';
import 'package:pla_tr/studentpages/CourseProvider/CoursePageHome.dart';
import 'package:pla_tr/studentpages/StudentDetails.dart';
import 'package:pla_tr/widgets/LoginScreenWidgets.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class StudentDash extends StatefulWidget {
  static String id = "Student_Dash";
  @override
  _StudentDashState createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {
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
    Colors.amber[900],
    Colors.orange,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    color.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color[4],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CompanyDifficulty.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              "assets/images/companyadmin.png",
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Companies \nList",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                "Apply to your \nFavorite Companies",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: color[1],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CoursePage.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Learn &\nPractise \nCode",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text("Learn a new skill \nUp Your Game",
                                  style: TextStyle(fontSize: 15))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                                child: Image.asset(
                              "assets/images/coding.png",
                              height: MediaQuery.of(context).size.height / 4,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: color[9],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, StudentDetails.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color[9],
                        ),
                        padding: EdgeInsets.all(45),
                        height: MediaQuery.of(context).size.height / 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/images/resume.png",
                                height: MediaQuery.of(context).size.height / 6,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Your \nDetails",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text("Edit Your \nProfile Data",
                                    style: TextStyle(fontSize: 15))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
