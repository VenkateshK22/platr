import 'package:flutter/material.dart';
import 'package:pla_tr/services/database.dart';

class StudentProfileViewA extends StatefulWidget {
  static String id = "Student_profile_view_Admin";

  @override
  _StudentProfileViewAState createState() => _StudentProfileViewAState();
}

class _StudentProfileViewAState extends State<StudentProfileViewA> {
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
                  userId: stream.data.docs[index]["userid"],
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
  final String userId;

  const UserTile({Key key, this.userName, this.userId}) : super(key: key);

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
    return GestureDetector(
      onTap: () {
        //  Navigator.pushNamed(context, ApplyCompany.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2),
        height: MediaQuery.of(context).size.height / 9,
        color: color[2],
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "id: $userId",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name: ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "$userName",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
