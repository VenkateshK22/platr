import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pla_tr/models/user.dart';

class DatabaseService {
  DatabaseService();

  Future<void> addQuizData(Map quizData, String quizId, String level) async {
    await FirebaseFirestore.instance
        .collection(level)
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future addQuestionData(Map questionData, String quizId, String level) async {
    await FirebaseFirestore.instance
        .collection(level)
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print("$e error from addqustn data database");
    });
  }

  Future getQuizTileData(String level) async {
    return FirebaseFirestore.instance.collection(level).snapshots();
  }

  Future getQuestionData(String quizId, String level) async {
    return await FirebaseFirestore.instance
        .collection(level)
        .doc(quizId)
        .collection("QNA")
        .get();
  }

  Future appliedCompaniesData(String quizId, String level) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(quizId)
        .collection("AppliedCompanies")
        .get();
  }

  Future applyToCompany(String companyid, String userid) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(userid)
        .collection("AppliedCompanies")
        .doc()
        .set({
      "company": companyid,
    });
  }

  Future<void> addCompanyData(
      Map companyData, String companyId, String companylevel) async {
    await FirebaseFirestore.instance
        .collection(companylevel)
        .doc(companyId)
        .set(companyData)
        .catchError((e) {
      print(e);
    });
  }

  Future getBegCompaniesData() async {
    return FirebaseFirestore.instance.collection("BegCompanies").snapshots();
  }

  Future getInterCompaniesData() async {
    return FirebaseFirestore.instance.collection("InterCompanies").snapshots();
  }

  Future getAdvCompaniesData() async {
    // companies is advcompanies in firebase console
    return FirebaseFirestore.instance.collection("AdvCompanies").snapshots();
  }

  Future getUserData(String userid) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(userid)
        .get();
  }

  Future getAllUserData() async {
    return FirebaseFirestore.instance.collection("Users").snapshots();
  }

  Future setUserData(String name, String age, String email, String phone,
      String gender, String resume, String education) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(UserId.userid)
        .set(
      {
        'userid': UserId.userid,
        'name': name,
        'email': email,
        'age': age,
        'gender': gender,
        'phone': phone,
        'resume': resume,
        'education': education,
      },
    );
  }
}
