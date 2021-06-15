import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final uid;

  DatabaseService(this.uid);

  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("QuizData")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("QuizData")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  Future getQuizTileData() async {
    return FirebaseFirestore.instance.collection("QuizData").snapshots();
  }

  Future getQuestionData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("QuizData")
        .doc(quizId)
        .collection("QNA")
        .get();
  }

  Future<void> addCompanyData(Map companyData, String companyId) async {
    await FirebaseFirestore.instance
        .collection("Companies")
        .doc(companyId)
        .set(companyData)
        .catchError((e) {
      print(e);
    });
  }

  Future getCompaniesData() async {
    return FirebaseFirestore.instance.collection("Companies").snapshots();
  }

  Future getUserData() async {
    return await FirebaseFirestore.instance.collection("Users").doc(uid).get();
  }

  Future setUserData(String email) async {
    return await FirebaseFirestore.instance.collection("Users").doc(uid).set(
      {
        'userid': uid,
        'email': email,
      },
    );
  }
}
