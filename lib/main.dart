import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'router_generator.dart' as RouterGen;
import 'routes.dart';

import 'package:okoalife/shared/authentication_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouterGen.Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthenticationHandler authenticationHandler = AuthenticationHandler();
  SignedInUserCridentials signedInUserCridentials = SignedInUserCridentials();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    // hold the instance of the authenticated user
    FirebaseUser user;
    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      // if so, return the current user
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = (await _auth.signInWithCredential(credential)).user;
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    // FirebaseUser user =
    await _handleSignIn();
    final snapShot = await Firestore.instance
        .collection('signed_up_users')
        .document('${signedInUserCridentials.email.value}')
        .get();

    if (snapShot == null || !snapShot.exists) {
      Navigator.popAndPushNamed(context, Routes.userType);
    }
    await Firestore.instance
        .collection('signed_up_users')
        .document('${signedInUserCridentials.email.value}')
        .get()
        .then((document) {
      // if user has complete setup and is a donor check
      print('🐛🐛  sign up status ${document.data['email']}');
      print('🐛🐛  sign up status ${document['userType']}');

      // check if user had completesd sign up
      if (document.data['hasCompletedSignUp'] == true) {
        print('🐛🐛  sign up status ${document['userType']}');
        // if user has complete setup and is a donor check
        if (document.data['userType'] == 'Donor') {
          Navigator.popAndPushNamed(context, Routes.donorHomePage);
        }
        // if user has complete setup and is a recipient check
        else if (document.data['userType'] == 'Recipient') {
          Navigator.popAndPushNamed(context, Routes.recipientHomePage);
        }
      } else {
        Navigator.popAndPushNamed(context, Routes.userType);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFC2262F),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Image(
                      image: AssetImage('assets/images/heart.png'),
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Okoalife',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/images/donor.png'),
              height: 180,
              width: 180,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, right: 20, left: 20),
              child: MaterialButton(
                height: 56,
                color: Color(0xFFC2262F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                onPressed: () {
                  // Sign in function starts executing here
                  print('🐛🐛  initializing login');
                  onGoogleSignIn(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/google_logo.png'),
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Sign in with google',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
