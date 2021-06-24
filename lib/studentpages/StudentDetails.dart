import 'package:flutter/material.dart';
import 'package:pla_tr/models/Student.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/studentpages/editstudentdetails.dart';

class StudentDetails extends StatefulWidget {
  static String id = "Student_Details_Page";
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  DatabaseService databaseService = new DatabaseService();
  StudentModel studentModel = new StudentModel();

  String name = "empty",
      age = "empty",
      numbr = "empty",
      gender = "empty",
      educ = "empty",
      resume = "empty",
      email = "empty",
      userid = UserId.userid;
  var snapshot;

  void initState() {
    super.initState();
    try {
      print("snapshot data is $snapshot ");
      getStudentDetails();
    } catch (e) {
      print(" $e in initstate");
    }
    setState(() {});
  }

  Future getStudentDetails() async {
    try {
      snapshot = await databaseService.getUserData(userid);
      name = snapshot.get('name');
      age = snapshot.get('age');
      educ = snapshot.get('education');
      gender = snapshot.get('gender');
      email = snapshot.get('email');
      numbr = snapshot.get('phone');
      resume = snapshot.get('resume');
      userid = snapshot.get('userid');
    } catch (e) {
      print("error in user Details $e ");
    }
    this.setState(() {});
  }

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

    var kTxtStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    List<Widget> viewDetails = [
      ShowDetailsWidget(
        color: color[2],
        text: Text(
          "Name: \n $name ",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[3],
        text: Text(
          "Age: \n $age",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[4],
        text: Text(
          "Gender: \n $gender",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[5],
        text: Text(
          "Education: \n$educ",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[6],
        text: Text(
          "Phone num: \n$numbr",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[7],
        text: Text(
          "Resume-Link: \n$resume",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[9],
        text: Text(
          "Email-id: \n$email",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        color: color[8],
        text: Text(
          "Std-Id: \n$userid",
          style: kTxtStyle,
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Details"),
        ),
        body: name == "empty"
            ? Center(
                child: Container(
                  child: Text(
                    "Add Data",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Center(
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: viewDetails,
                    ),
                  ],
                )),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, EditStdDetails.id).then((value) {
              getStudentDetails();
              setState(() {});
            });
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.edit_sharp),
        ),
      ),
    );
  }
}

class ShowDetailsWidget extends StatelessWidget {
  final Color color;
  final Text text;

  const ShowDetailsWidget({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(2),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 9.5,
        child: text,
      ),
    );
  }
}
