import 'package:flutter/material.dart';
import 'package:pla_tr/services/database.dart';

class StudentProfileViewCompany extends StatefulWidget {
  static String id = "Student_profile_view";

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
    return Scaffold(
      appBar: AppBar(
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
