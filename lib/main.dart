import 'package:flutter/material.dart';  

import 'router_generator.dart';
import 'routes.dart';

import 'package:mydoorstep/shared/authentication_handler.dart';

void main() { 
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/app_logo.png'),
              height: 110,
              width: 140,
            ),
            Text('MyDoorstep'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                height: 56,
                color: Color(0xFF6DD288),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                onPressed: () async {
                  // Sign in function starts executing here
                  print('🐛🐛  initializing login');
                  await authenticationHandler.signInWithGoogle().whenComplete(() {
                    Navigator.popAndPushNamed(context, Routes.homePage);
                  });
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
