import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  //App name logo widget
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(
            text: 'Pla',
            style: GoogleFonts.pacifico(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          TextSpan(
            text: ' -Tr',
            style: GoogleFonts.asap(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    );
  }
}

Widget blueButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height / 11,
    width: MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
      textAlign: TextAlign.center,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SubAddButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height / 13.5,
    width: MediaQuery.of(context).size.width / 2.2,
    child: Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
      textAlign: TextAlign.center,
    ),
  );
}
