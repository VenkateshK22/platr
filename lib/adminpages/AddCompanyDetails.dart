import 'package:flutter/material.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';
import 'package:random_string/random_string.dart';

class CreateCompany extends StatefulWidget {
  static String id = "Add_Companies";

  @override
  _CreateCompanyState createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  final _formKey = GlobalKey<FormState>();
  String companyLogoUrl, companyName, jobDetails, companylevel;

  bool isLoading = false;
  String companyId;

  DatabaseService databaseService = new DatabaseService();

  createCompany() async {
    companyId = randomAlphaNumeric(16);
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> companyData = {
        "companyId": companyId,
        "companyLogoUrl": companyLogoUrl,
        "companyName": companyName,
        "JobDetails": jobDetails,
        "companyLevel": companylevel,
      };

      await databaseService
          .addCompanyData(companyData, companyId, companylevel)
          .then(
        (value) {
          setState(() {
            isLoading = false;
          });
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
                          val.isEmpty ? "Enter Company logo URL!!" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.image),
                          hintText: "Company Logo URL "),
                      onChanged: (val) {
                        companyLogoUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Company Name" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.title), hintText: "Company Name"),
                      onChanged: (val) {
                        companyName = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Job Details" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: "Job Description"),
                      onChanged: (val) {
                        jobDetails = val;
                      },
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Company level" : null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: "Beg or Inter or Adv + Companies"),
                      onChanged: (val) {
                        companylevel = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () => createCompany(),
                        child: blueButton(context, 'Add Company!')),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
