import 'package:flutter/material.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/services/auth.dart';
import 'package:pla_tr/services/database.dart';

class StudentProfileViewCompany extends StatefulWidget {
  static String id = "company_dash_view";

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
    databaseService.getAllUserData().then((value) {
      usersStream = value;
      setState(() {});
    });
  }

  Widget usersListWidget() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
        stream: usersStream,
        builder: (context, stream) {
          if (stream.data == null) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return ListView.builder(
              itemCount: stream.data.docs.length,
              itemBuilder: (context, index) {
                return UserTile(
                  userName: stream.data.docs[index]["name"],
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
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'LogOut',
            onPressed: () {
              authService.SignOut();
              Navigator.popAndPushNamed(context, LoginPage.id);

              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is logout')));
            },
          ),
        ],
        title: Center(child: Text("Student Profiles")),
      ),
      body: usersListWidget(),
    );
  }
}

class UserTile extends StatelessWidget {
  final String userName;

  const UserTile({Key key, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  Navigator.pushNamed(context, ApplyCompany.id);
      },
      child: Container(
        color: Colors.amber,
        width: double.infinity,
        child: Center(child: Text(userName)),
      ),
    );
  }
}
