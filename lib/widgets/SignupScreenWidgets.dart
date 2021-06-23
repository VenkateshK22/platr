import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pla_tr/authUI/LoginPage.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/auth.dart';
import 'package:pla_tr/services/database.dart';

String email, password, repassword, username;

final _formKey = GlobalKey<FormState>();
AuthService authService = new AuthService();
DatabaseService _databaseService = new DatabaseService();
UserId user;
String uid = UserId.userid;
// ignore: non_constant_identifier_names
SignUP(context) async {
  if (_formKey.currentState.validate()) {
    authService.SignUpwitEmailandPass(email, password).then((value) async {
      if (value != null) {
        _databaseService.setUserData("", "", "", "", "", "", "");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {
        print('sign-in not working');
      }
    });
  }
}

Widget buildContainer(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign-Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height / 25),
                  ),
                ],
              ),
              buildemailRow(),
              buildPasswordRow(),
              buildRePasswordRow(),
              signupButton(context),
              buildOrRow(),
              loginButton(context),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildLogo(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Pla-Tr",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height / 20,
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Icon(
          Icons.work_rounded,
          size: 80,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget buildemailRow() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) {
          return value.isEmpty ? "Enter Email id" : null;
        },
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          email = value;
          print(value);
        },
        decoration:
            InputDecoration(prefixIcon: Icon(Icons.email), labelText: 'E-mail'),
      ),
    ),
  );
}

Widget buildPasswordRow() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Form(
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          return value.isEmpty ? "Enter Password" : null;
        },
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value) {
          password = value;
          print(value);
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_rounded), labelText: 'Password'),
      ),
    ),
  );
}

Widget buildRePasswordRow() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Form(
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          return value.isEmpty ? "Re-enter Password" : null;
        },
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value) {
          repassword = value;
          print(value);
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            labelText: 'Confirm Password'),
      ),
    ),
  );
}

Widget loginButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        height: 1.2 * (MediaQuery.of(context).size.height / 20),
        width: 5 * (MediaQuery.of(context).size.width / 10),
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Text("Login")),
      ),
    ],
  );
}

Widget buildOrRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        child: Text(
          '- OR -',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      )
    ],
  );
}

Widget signupButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        height: 1.2 * (MediaQuery.of(context).size.height / 20),
        width: 5 * (MediaQuery.of(context).size.width / 10),
        child: ElevatedButton(
            onPressed: () {
              SignUP(context);
            },
            child: Text("Sign-Up")),
      ),
    ],
  );
}
