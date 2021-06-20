import 'package:flutter/material.dart';
import 'package:pla_tr/quiz/addQuestion.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  static String id = "CreateQuiz";
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImgUrl, quizTitle, quizDesc, quizLevel;

  bool isLoading = false;
  String quizId;

  DatabaseService databaseService = new DatabaseService();

  createQuiz() async {
    quizId = randomAlphaNumeric(16);
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        "quizId": quizId,
        "quizImgUrl": quizImgUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDesc,
        "quizLevel": quizLevel
      };

      await databaseService.addQuizData(quizData, quizId, quizLevel).then(
        (value) {
          setState(() {
            isLoading = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddQuestion(
                quizId: quizId,
                quizLevel: quizLevel,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppLogo(),
        elevation: 0.0,
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Image URL!!" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.image), hintText: "Quiz Image URL "),
                      onChanged: (val) {
                        quizImgUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Title!!" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.title), hintText: "Quiz Title"),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Description!!" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: "Quiz Description"),
                      onChanged: (val) {
                        quizDesc = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Level!" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: "Beg or Inter or Adv + QuizData"),
                      onChanged: (val) {
                        quizLevel = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () => createQuiz(),
                        child: blueButton(context, 'Create Quiz!')),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
