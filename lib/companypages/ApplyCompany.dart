import 'package:flutter/material.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class ApplyCompany extends StatefulWidget {
  static String id = "apply_company";
  final companyid;
  final companyimagelink;
  final String companyName;
  final String companyDetails;

  const ApplyCompany(
      {Key key,
      this.companyid,
      this.companyimagelink,
      this.companyName,
      this.companyDetails})
      : super(key: key);

  @override
  _ApplyCompanyState createState() => _ApplyCompanyState();
}

class _ApplyCompanyState extends State<ApplyCompany> {
  String userid = UserId.userid;
  List color = [
    Colors.red,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.deepOrange,
  ];

  @override
  void initState() {
    super.initState();
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
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color[2],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Company ID: ${widget.companyid}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      " ${widget.companyDetails}",
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
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color[4],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Job Description: \n(Beginner) Associate Engineer ",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
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
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height / 11,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Apply To ${widget.companyName}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),
              ),
            )
          ],
        ));
  }
}
