import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _gSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    return user;
  }

  Future<FirebaseUser> _aSignIn() async {
    FirebaseUser user = await _auth.signInAnonymously();

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      children: <Widget>[
        SizedBox(
          height: 200.0,
        ),
        Image.asset(
          'images/logo.png',
          width: 100.0,
          height: 100.0,
        ),
        SizedBox(
          height: 100.0,
        ),
        FlatButton(
          child: Image.asset(
            'images/google.png',
            fit: BoxFit.fill,
          ),
          onPressed: () => _gSignIn().then((FirebaseUser user) => debugPrint('hi')),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlatButton(
          child: Image.asset(
            'images/anonymous.png',
            fit: BoxFit.fill,
          ),
          onPressed: () => _aSignIn().then((FirebaseUser user) => debugPrint('hi2')),
        )
      ],
    );
  }
}
