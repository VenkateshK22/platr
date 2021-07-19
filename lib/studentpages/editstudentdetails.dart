import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/studentpages/changeemail.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class EditStdDetails extends StatefulWidget {
  static String id = "Edit_Student_Details_Page";

  @override
  _EditStdDetailsState createState() => _EditStdDetailsState();
}

class _EditStdDetailsState extends State<EditStdDetails> {
  final _formKey = GlobalKey<FormState>();
  String userid = UserId.userid;
  DatabaseService databaseService = new DatabaseService();
  String nameO, ageO, phoneO, genderO, resumeO, educationO;

  var snapshot;

  initState() {
    print("in init of editdetials");
    super.initState();
    getStudentDetails();
    this.setState(() {});
  }

  String nameN, ageN, email, phoneN, genderN, resumeN, educationN;

  Future getStudentDetails() async {
    try {
      snapshot = await databaseService.getUserData(userid);
      email = UserId.email;

      nameO = snapshot.get('name');
      ageO = snapshot.get('age');
      educationO = snapshot.get('education');
      genderO = snapshot.get('gender');
      phoneO = snapshot.get('phone');
      resumeO = snapshot.get('resume');
      nameN = nameO;
      ageN = ageO;
      genderN = genderO;
      resumeN = resumeO;
      educationN = educationO;
      phoneN = phoneO;

      print("in init of editdetials");
      print("value of name is ${snapshot.get('name')}");
    } catch (e) {
      print("error in user Details $e ");
    }
    this.setState(() {});
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppLogo(),
      ),
      body: userid == null || nameO == null
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Edit Your Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      initialValue: snapshot.get('name'),
                      validator: (val) => val.isEmpty ? "Enter name" : null,
                      onChanged: (value) {
                        nameN = value;
                      },
                      decoration: InputDecoration(labelText: "name"),
                    ),
                    TextFormField(
                      initialValue: ageO,
                      validator: (val) => val.isEmpty ? "Enter age " : null,
                      onChanged: (value) {
                        ageN = value;
                      },
                      decoration:
                          InputDecoration(labelText: "age", prefixText: ""),
                    ),
                    TextFormField(
                      initialValue: genderO,
                      validator: (val) => val.isEmpty ? "Enter gender " : null,
                      onChanged: (value) {
                        genderN = value;
                      },
                      decoration:
                          InputDecoration(labelText: "gender", prefixText: ""),
                    ),
                    TextFormField(
                      initialValue: phoneO,
                      validator: (val) =>
                          val.isEmpty ? "Enter phone number " : null,
                      onChanged: (value) {
                        phoneN = value;
                      },
                      decoration: InputDecoration(
                        labelText: "phone-number",
                        prefixText: "+91 ",
                      ),
                    ),
                    TextFormField(
                      initialValue: educationO,
                      validator: (val) =>
                          val.isEmpty ? "Enter Education" : null,
                      onChanged: (value) {
                        educationN = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Education", prefixText: "UG & PG: "),
                    ),
                    TextFormField(
                      initialValue: resumeO,
                      validator: (value) =>
                          value.isEmpty ? "Enter Link to Your Resume" : null,
                      onChanged: (value) {
                        resumeN = value;
                      },
                      decoration: InputDecoration(
                          labelText: "Resume-Link", suffixText: "https://"),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ChangeEmailId.id);
                      },
                      child: Text('Change/Update Email Address'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 11,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            databaseService
                                .setUserData(nameN, ageN, email, phoneN,
                                    genderN, resumeN, educationN)
                                .then(
                              (value) {
                                Fluttertoast.showToast(
                                  msg: 'Successfully Updated!',
                                );

                                print('User Data added Sucessfully');
                              },
                            );

                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Save and Return",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
