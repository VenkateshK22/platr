import 'package:flutter/material.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';

class AppliedCompanyList extends StatefulWidget {
  static String id = "Applied_Companies_List";

  @override
  _AppliedCompanyListState createState() => _AppliedCompanyListState();
}

class _AppliedCompanyListState extends State<AppliedCompanyList> {
  Stream companyStream;
  DatabaseService databaseService = new DatabaseService();

  @override
  initState() {
    super.initState();
    databaseService.appliedCompaniesData(UserId.userid).then((value) {
      companyStream = value;
      setState(() {});
    });
  }

  Widget companyListWidget() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
        stream: companyStream,
        builder: (context, stream) {
          if (stream.data == null) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return ListView.builder(
              itemCount: stream.data.docs.length,
              itemBuilder: (context, index) {
                return CompanyTile(
                  companyLogoUrl: stream.data.docs[index]["companyLogoUrl"],
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
        title: Text("Applied Companies"),
      ),
      body: companyListWidget(),
    );
  }
}

class CompanyTile extends StatelessWidget {
  final String companyLogoUrl;

  const CompanyTile({
    Key key,
    @required this.companyLogoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
        )
      ]),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      height: 150,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              companyLogoUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
