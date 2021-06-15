import 'package:flutter/material.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class ApplyCompany extends StatefulWidget {
  static String id = "apply_company";
  @override
  _ApplyCompanyState createState() => _ApplyCompanyState();
}

class _ApplyCompanyState extends State<ApplyCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
      ),
    );
  }
}
