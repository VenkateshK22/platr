import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/quiz/Quiz_Play.dart';
import 'package:pla_tr/quiz/create_quiz_page.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class QuizHome extends StatefulWidget {
  static String id = 'Quiz_home_Page';

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService(UserId());

  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return QuizTile(
                      imgURL: snapshot.data.docs[index]["quizImgUrl"],
                      title: snapshot.data.docs[index]["quizTitle"],
                      desc: snapshot.data.docs[index]["quizDesc"],
                      quizId: snapshot.data.docs[index]["quizId"],
                    );
                  },
                );
        },
      ),
    );
  }

  @override
  initState() {
    databaseService.getQuizTileData().then((value) {
      setState(() {
        quizStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppLogo(),
        elevation: 0.0,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateQuiz()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgURL;
  final String title;
  final String desc;
  final String quizId;

  const QuizTile(
      {Key key,
      @required this.imgURL,
      @required this.title,
      @required this.desc,
      this.quizId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizPlay(quizId)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgURL,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                  Text(
                    desc,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
