import 'package:flutter/material.dart';
import 'package:pla_tr/companypages/CompanyList.dart';

class CompanyDifficulty extends StatefulWidget {
  static String id = "Company_Difficulty_Page";
  @override
  _CompanyDifficultyState createState() => _CompanyDifficultyState();
}

class _CompanyDifficultyState extends State<CompanyDifficulty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Levels'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                  Navigator.pushNamed(context, CompanyList.id);
                },
                child: Row(children: [
                  ClipRRect(
                      child: Image.asset(
                    "assets/images/beginner.png",
                    height: MediaQuery.of(context).size.height / 3.5,
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Beginner \nCompanies",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                      Text(
                        "Companies for \nFreshers",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                  Navigator.pushNamed(context, CompanyList.id);
                },
                child: Row(
                  children: [
                    ClipRRect(
                        child: Image.asset(
                      "assets/images/intermediate.png",
                      height: MediaQuery.of(context).size.height / 3.5,
                    )),
                    SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Intermediate \nCompanies",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[600]),
                        ),
                        Text(
                          "Companies for \n Change seekers ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                  Navigator.pushNamed(context, CompanyList.id);
                },
                child: Row(
                  children: [
                    ClipRRect(
                        child: Image.asset(
                      "assets/images/advanced.png",
                      height: MediaQuery.of(context).size.height / 3.5,
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Advanced \nCompanies",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.red[400]),
                        ),
                        Text(
                          "Companies for \n Professionals",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
