import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';

import '../routes.dart';

class HealthTipsPage extends StatefulWidget {
  @override
  _HealthTipsPageState createState() => _HealthTipsPageState();
}

class _HealthTipsPageState extends State<HealthTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: <Widget>[
          OkoaLifeAppBar(title: 'Health Tips'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.articlePage);
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/blood_rich.jpeg'))),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Blood filled foods',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'This article explains the importance of donors maintaining a healthy life style. The article talks of blood filled foods. ',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Read more >>',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.articlePage);
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/bagger.jpg'))),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Foods to avoid',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'This article explains the importance of avoiding fast foods for a donor. ',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Read more >>',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
