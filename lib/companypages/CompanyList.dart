import 'package:flutter/material.dart';
import 'package:pla_tr/companypages/ApplyCompany.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';
import 'package:pla_tr/widgets/QuizWidgets.dart';

class CompanyList extends StatefulWidget {
  static String id = "Companies_List";

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  Stream companyStream;
  DatabaseService databaseService = new DatabaseService(UserId());

  @override
  initState() {
    super.initState();
    databaseService.getCompaniesData().then((value) {
      setState(() {
        companyStream = value;
      });
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
            print("inside else of builder");
            return ListView.builder(
              itemCount: stream.data.docs.length,
              itemBuilder: (context, index) {
                print("item count = ${stream.data.docs.length}");
                return CompanyTile(
                  companyLogoUrl: stream.data.docs[index]["companyLogoUrl"],
                  companyName: stream.data.docs[index]["companyName"],
                  companyDetails: stream.data.docs[index]["companyDetails"],
                  companyId: stream.data.docs[index]["companyId"],
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
        title: AppLogo(),
      ),
      body: companyListWidget(),
    );
  }
}

class CompanyTile extends StatelessWidget {
  final String companyLogoUrl;
  final String companyName;
  final String companyDetails;
  final String companyId;

  const CompanyTile(
      {Key key,
      @required this.companyLogoUrl,
      @required this.companyName,
      @required this.companyDetails,
      this.companyId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ApplyCompany.id);
      },
      child: Container(
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
      ),
    );
  }
}
