import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class HelpPage extends StatefulWidget {
  static String id = "Help_view_Admin";

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  DatabaseService databaseservice = new DatabaseService();
  String helptext = "";
  String name = "";

  initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    var snap = await databaseservice.getUserData(UserId.userid);
    name = snap.get("name");
    print(name + "name");
  }

  void submitIssue() {
    databaseservice.setUserQueries(name, helptext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: AppLogo()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Facing Issues Or Need Help ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.question_answer),
                        hintText: "Please explain your issue here"),
                    onChanged: (value) => helptext = value,
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 10,
                child: TextButton(
                  onPressed: () {
                    if (helptext == "") {
                      Fluttertoast.showToast(
                        gravity: ToastGravity.CENTER,
                        msg: 'Insert Query!',
                      );
                    } else {
                      Fluttertoast.showToast(
                        gravity: ToastGravity.CENTER,
                        msg: 'Issue Successfully Submitted!',
                      );
                      submitIssue();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Submit Query",
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
