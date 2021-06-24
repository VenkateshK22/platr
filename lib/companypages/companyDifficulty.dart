import 'package:flutter/material.dart';
import 'package:pla_tr/companypages/AdvCompanyList.dart';
import 'package:pla_tr/companypages/AppliedCompList.dart';
import 'package:pla_tr/companypages/CompanyList.dart';
import 'package:pla_tr/companypages/InterCompanyList.dart';

class CompanyDifficulty extends StatefulWidget {
  static String id = "Company_Difficulty_Page";
  @override
  _CompanyDifficultyState createState() => _CompanyDifficultyState();
}

class _CompanyDifficultyState extends State<CompanyDifficulty> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, AppliedCompanyList.id);
          },
          child: Icon(Icons.check_box),
        ),
        appBar: AppBar(
          title: Text('Company Levels'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
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
                    Container(
                        height: 180,
                        width: 180,
                        child: Image.asset(
                          "assets/images/promotion.png",
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
                              color: Colors.white),
                        ),
                        Text(
                          "  Companies for \n  Freshers",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
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
                    Navigator.pushNamed(context, InterCompanyList.id);
                  },
                  child: Row(
                    children: [
                      Container(
                          height: 180,
                          width: 180,
                          child: Image.asset(
                            "assets/images/certificate.png",
                            height: MediaQuery.of(context).size.height / 3.5,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Intermediate \nCompanies",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "  Companies for \n  Change seekers ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
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
                    Navigator.pushNamed(context, AdvCompanyList.id);
                  },
                  child: Row(
                    children: [
                      Container(
                          height: 180,
                          width: 180,
                          child: Image.asset(
                            "assets/images/career.png",
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
                                color: Colors.white),
                          ),
                          Text(
                            "  Companies for \n  Professionals",
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
      ),
    );
  }
}
