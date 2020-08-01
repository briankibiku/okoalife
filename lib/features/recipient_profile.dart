import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';

class RecipientProfilePage extends StatefulWidget {
  @override
  _RecipientProfilePageState createState() => _RecipientProfilePageState();
}

class _RecipientProfilePageState extends State<RecipientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), 
      body: Container(
        child: Column(
          children: <Widget>[
            OkoaLifeAppBar(title: 'Recipient Profile'),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, bottom: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFC2262F), width: 1),
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
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xFFC2262F),
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Blood Group',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'B Positive',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Phone Number',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '+2547 21 123 456',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 10),
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
                  right: 20.0, left: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Blood Group',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'B Positive',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
