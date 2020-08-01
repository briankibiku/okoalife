import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';

class BloodRequestDetailPage extends StatefulWidget {
  @override
  _BloodRequestDetailPageState createState() => _BloodRequestDetailPageState();
}

class _BloodRequestDetailPageState extends State<BloodRequestDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          backgroundColor: Color(0xFFC2262F),
          onPressed: () {},
          label: Text('Accept & Call Recipient')),
      body: Container(
        child: Column(
          children: <Widget>[
            OkoaLifeAppBar(title: 'Blood Request Page'),
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
                  Icon(Icons.person_pin_circle, color: Color(0xFFC2262F)),
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
                  Icon(Icons.phone, color: Color(0xFFC2262F)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Phone',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '+254 721 123 456',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Extra Information',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Color(0xFFC2262F),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Request for donor to arrive morning hours from 7:00 AM  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Color(0xFFC2262F),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Preferred female donor',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Color(0xFFC2262F),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'A donor who does not smoke',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
