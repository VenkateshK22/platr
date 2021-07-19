import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pla_tr/companypages/AppliedCompList.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/studentpages/CourseProvider/CoursePageHome.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class ApplyCompany extends StatefulWidget {
  static String id = "apply_company";
  final companyid;
  final companyimagelink;
  final String companyName;
  final String jobDetails;

  const ApplyCompany({
    Key key,
    this.companyid,
    this.companyimagelink,
    this.companyName,
    this.jobDetails,
  }) : super(key: key);

  @override
  _ApplyCompanyState createState() => _ApplyCompanyState();
}

class _ApplyCompanyState extends State<ApplyCompany> {
  DatabaseService databaseService = new DatabaseService();

  String userid = UserId.userid;
  static bool exists = true;

  List color = [
    Colors.red,
    Colors.purple,
    Colors.indigoAccent,
    Colors.blue,
    Colors.green,
    Colors.amberAccent,
    Colors.orange,
    Colors.deepOrange,
  ];

  @override
  void initState() {
    super.initState();
    checkExist(widget.companyid);
  }

  static Future<bool> checkExist(String docID) async {
    try {
      print("inside checker $docID docid");
      var snap;
      snap = FirebaseFirestore.instance
          .collection('Users')
          .doc(UserId.userid)
          .collection('AppliedCompanies')
          .doc(docID)
          .get()
          .then((value) {
        if (value.exists) {
          print("${value.id} exists ${value.data()}");
          exists = true;
        } else {
          print("${value.id} does not exisst ${value.data()}");
          exists = false;
        }
      });

      print("$snap snap and $exists exists ");

      return exists;
    } catch (e) {
      print(e);
      return true;
    }
  }

  void alreadyApplied() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Already Applied!!'),
      ),
    );
  }

  Future<void> addData() async {
    if (exists) {
      alreadyApplied();
    } else {
      databaseService.insertIntappliedcompaniesstep1(widget.companyid);
      databaseService.insertIntappliedcompanies(widget.companyid);
      databaseService.applyToCompany(userid, widget.companyName,
          widget.companyimagelink, widget.companyid);
    }
  }

  @override
  Widget build(BuildContext context) {
    color.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Image.network(
              widget.companyimagelink,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color[2],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "Company ID: ${widget.companyid}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Center(
                  child: Text(
                    "Name: ${widget.companyName}",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    " ",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, CoursePage.id),
            child: Container(
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color[4],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Job Description: \n ${widget.jobDetails} ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.restorablePopAndPushNamed(context, CoursePage.id),
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 9,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color[7],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Check out Learn and code to learn new skillset  ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              addData();
              Navigator.pushNamed(
                context,
                AppliedCompanyList.id,
              );
            },
            child: Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height / 10,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Apply To ${widget.companyName}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
