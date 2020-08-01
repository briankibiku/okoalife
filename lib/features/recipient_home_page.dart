import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';

import '../routes.dart';

class RecipientHomePage extends StatefulWidget {
  @override
  _RecipientHomePageState createState() => _RecipientHomePageState();
}

class _RecipientHomePageState extends State<RecipientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: <Widget>[
          OkoaLifeAppBar(title: 'Recipient Home Page'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/blood.png'),
                  height: 140,
                  width: 140,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Navigator.pushNamed(context, Routes.donorHomePage);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Color(0xFFC2262F), width: 1)),
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFC2262F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(80),
                              ),
                            ),
                          ),
                          Text(
                            'View Profile',
                            style: TextStyle(
                                color: Color(0xFFC2262F), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.postBloodRequestPage);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Color(0xFFC2262F), width: 1)),
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFC2262F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(80),
                              ),
                            ),
                          ),
                          Text(
                            'Post Appeal',
                            style: TextStyle(
                                color: Color(0xFFC2262F), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'My Blood Appeals',
            style: TextStyle(color: Color(0xFFC2262F), fontSize: 18),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 250,
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 20, bottom: 10, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFC2262F), width: 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(80),
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFFC2262F),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('John Doe')
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFC2262F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Urgnet',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.person_pin_circle,
                              color: Color(0xFFC2262F)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Blood Type',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'A Positive',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 5, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.local_hospital, color: Color(0xFFC2262F)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Hospital',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'KHN Hospital',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 5, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.location_on, color: Color(0xFFC2262F)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Location',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Madaraka',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 5, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.location_on, color: Color(0xFFC2262F)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Status',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'PENDING',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
