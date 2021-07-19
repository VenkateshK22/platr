import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/services/auth.dart';
import 'package:pla_tr/services/database.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchInBrowser(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      Fluttertoast.showToast(msg: "please enter a valid url");
      throw 'Could not launch $url';
    }
  } catch (e) {
    print(e);
  }
}

class GetUserProfileData extends StatefulWidget {
  static String id = "Get_user_profile_data";
  final String userid;

  const GetUserProfileData({Key key, this.userid}) : super(key: key);
  @override
  _GetUserProfileDataState createState() => _GetUserProfileDataState();
}

class _GetUserProfileDataState extends State<GetUserProfileData> {
  initState() {
    super.initState();
    getStudentDetails();
  }

  AuthService authService = new AuthService();
  DatabaseService databaseService = new DatabaseService();

  var snapshot;
  String name = "",
      age = "",
      numbr = "",
      gender = "",
      educ = "",
      resume = "",
      email = "",
      userid = "";
  bool resumebool = false;

  Future getStudentDetails() async {
    print(widget.userid);

    try {
      snapshot = await databaseService.getUserData(widget.userid);
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
        resumebool: false,
        color: color[2],
        text: Text(
          "Name: \n $name ",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: false,
        color: color[3],
        text: Text(
          "Age: \n $age",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: false,
        color: color[4],
        text: Text(
          "Gender: \n $gender",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: false,
        color: color[5],
        text: Text(
          "Education: \n$educ",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: false,
        color: color[6],
        text: Text(
          "Phone num: \n$numbr",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: true,
        resumelnk: resume,
        color: color[7],
        text: Text(
          "Resume-Link: \n$resume",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: false,
        color: color[9],
        text: Text(
          "Email-id: \n$email",
          style: kTxtStyle,
        ),
      ),
      ShowDetailsWidget(
        resumebool: false,
        color: color[8],
        text: Text(
          "Student-Id: \n$userid",
          style: kTxtStyle,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'LogOut',
            onPressed: () {
              authService.SignOut();
              Navigator.popAndPushNamed(context, LoginPage.id);
            },
          )
        ],
      ),
      body: name == "empty"
          ? Center(
              child: Container(
                child: Text(
                  "Add Data",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
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
    );
  }
}

class ShowDetailsWidget extends StatelessWidget {
  final Color color;
  final Text text;
  final bool resumebool;
  final String resumelnk;

  const ShowDetailsWidget(
      {Key key, this.color, this.text, this.resumebool, this.resumelnk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (resumebool == true) {
            _launchInBrowser(resumelnk);
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Resume Link"),
                content: SelectableText(resumelnk),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("okay"),
                  ),
                ],
              ),
            );
          }
        },
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
      ),
    );
  }
}
