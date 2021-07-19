import 'package:flutter/material.dart';
import 'package:pla_tr/services/database.dart';

class StudentQueries extends StatefulWidget {
  static String id = "Student_queries";

  @override
  _StudentQueriesState createState() => _StudentQueriesState();
}

class _StudentQueriesState extends State<StudentQueries> {
  DatabaseService databaseService = new DatabaseService();
  Stream usersStream;
  @override
  initState() {
    super.initState();
    databaseService.getAllUserQueries().then((value) {
      usersStream = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Queries"),
      ),
      body: studQueriesList(),
    );
  }

  studQueriesList() {
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
                return UserQueryTile(
                  userId: stream.data.docs[index]["userid"],
                  userName: stream.data.docs[index]["name"],
                  userEmail: stream.data.docs[index]["email"],
                  userQuery: stream.data.docs[index]["queries"],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class UserQueryTile extends StatelessWidget {
  final String userName;
  final String userId;
  final String userEmail;
  final String userQuery;

  const UserQueryTile(
      {Key key, this.userName, this.userId, this.userEmail, this.userQuery})
      : super(key: key);

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
        height: MediaQuery.of(context).size.height / 5,
        color: color[2],
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Name: ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "$userName",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "email: ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "$userEmail",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "query: ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "$userQuery",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
