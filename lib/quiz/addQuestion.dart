import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class AddQuestion extends StatefulWidget {
  static String id = "add_Question";
  final String quizId;
  final String quizLevel;

  const AddQuestion({Key key, this.quizId, this.quizLevel}) : super(key: key);
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();

  DatabaseService databaseService = new DatabaseService();

  bool isLoading = false;

  String question = "", option1 = "", option2 = "", option3 = "", option4 = "";

  uploadQuizData() {
    if (_formKey.currentState.validate()) {
      isLoading = true;
      setState(() {});

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      print("${widget.quizId} printing quiz id ");
      databaseService
          .addQuestionData(questionMap, widget.quizId, widget.quizLevel)
          .then((value) {
        print("inside add qstn");
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        isLoading = false;
        setState(() {});
      }).catchError((e) {
        print("catching error $e ");
      });
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Question" : null,
                        decoration:
                            InputDecoration(hintText: "Enter Question "),
                        onChanged: (val) {
                          question = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option1" : null,
                        decoration: InputDecoration(
                            hintText: "Enter option1 (CORRECT ANSWER)"),
                        onChanged: (val) {
                          option1 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option2" : null,
                        decoration: InputDecoration(hintText: "Enter option2 "),
                        onChanged: (val) {
                          option2 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option3" : null,
                        decoration: InputDecoration(hintText: "Enter option3 "),
                        onChanged: (val) {
                          option3 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option4" : null,
                        decoration: InputDecoration(hintText: "Enter option4 "),
                        onChanged: (val) {
                          option4 = val;
                        },
                      ),
                      Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                uploadQuizData();
                              },
                              child: SubAddButton(context, 'Add Question')),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SubAddButton(context, 'Submit !')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
