import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/companypages/GetUserProfileData.dart';
import 'package:pla_tr/services/auth.dart';
import 'package:pla_tr/services/database.dart';

class StudentProfileViewCompany extends StatefulWidget {
  static String id = "Student_Profile_view_company";
  final compid;

  const StudentProfileViewCompany({Key key, this.compid}) : super(key: key);

  @override
  _StudentProfileViewCompanyState createState() =>
      _StudentProfileViewCompanyState();
}

class _StudentProfileViewCompanyState extends State<StudentProfileViewCompany> {
  Stream usersStream;
  DatabaseService databaseService = new DatabaseService();

  @override
  initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    databaseService.getApplUserDataComp(widget.compid).then((value) {
      usersStream = value;
      setState(() {});
    });
  }

  Widget usersListWidget() {
    return Container(
      child: StreamBuilder(
        stream: usersStream,
        builder: (context, stream) {
          if (stream.data == null) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            print("inside builder ${stream.data.docs.length}");
            return ListView.builder(
              itemCount: stream.data.docs.length,
              itemBuilder: (context, index) {
                print(stream.data.docs.length);
                return UserTile(
                  userName: stream.data.docs[index]['email'],
                  userId: stream.data.docs[index]['userid'],
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = new AuthService();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
        title: Center(
          child: Text("Applied Profiles"),
        ),
      ),
      body: usersListWidget(),
    );
  }
}

class UserTile extends StatelessWidget {
  final String userName;
  final String userId;

  const UserTile({Key key, this.userName, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GetUserProfileData(userid: userId),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(8)),
        height: MediaQuery.of(context).size.height / 11,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$userName",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
