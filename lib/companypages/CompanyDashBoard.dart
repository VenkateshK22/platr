import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/companypages/studentprofileviewcompany.dart';
import 'package:pla_tr/services/auth.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class CompanyDash extends StatefulWidget {
  static String id = "Company_dash";

  @override
  _CompanyDashState createState() => _CompanyDashState();
}

class _CompanyDashState extends State<CompanyDash> {
  AuthService authService = new AuthService();
  String companyid;
  bool isTru = false;
  var snap;

  Future<bool> companyExists(String compid) async {
    try {
      companyid = compid;
      print("inside checker");
      snap = FirebaseFirestore.instance
          .collection('AppliedCompanies')
          .doc(compid)
          .get()
          .then((value) {
        if (value.exists) {
          print("${value.id} exists ${value.data()}");
          isTru = true;
        } else {
          print("${value.id} does not exisst ${value.data()}");
          isTru = false;
        }
      });

      return isTru;
    } catch (e) {
      print(e);
      return isTru;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'LogOut',
            onPressed: () {
              authService.SignOut();
              Navigator.popAndPushNamed(context, LoginPage.id);
            },
          ),
        ],
        title: AppLogo(),
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              child: ClipRRect(
                child: Image.asset("assets/images/buildings(1).png"),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                onChanged: (value) => companyExists(value),
                decoration: InputDecoration(
                  hintText: 'Enter Your Company ID',
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 10,
              child: ElevatedButton(
                onPressed: () {
                  if (isTru == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentProfileViewCompany(compid: companyid),
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                        gravity: ToastGravity.CENTER,
                        msg: "No Applied Students Currently ");
                  }
                },
                child: Text(
                  "Get Students Data >",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.amber)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
