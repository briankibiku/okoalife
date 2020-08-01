import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:okoalife/features/user_type.dart';
// import 'package:rxdart/rxdart.dart';

import '../routes.dart';

class DonorHomePage extends StatefulWidget {
  @override
  _DonorHomePageState createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<DonorHomePage> {
  final Firestore firestore = Firestore.instance;

  void _getBloodRequests() async {
    await Firestore.instance
        .collection('B Positive')
        .where('location', isEqualTo: 'Madaraka')
        .getDocuments()
        .then((value) {
      value.documents.forEach((result) {
        print(result.data);
        print(
            'result.data 🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _getBloodRequests();
    });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: <Widget>[
          OkoaLifeAppBar(title: 'Donor Home Page'),
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
                  onTap: () {
                    // _getBloodRequests();
                    Navigator.pushNamed(context, Routes.recipientHomePage);
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
                    Navigator.pushNamed(context, Routes.healthTipsPage);
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
                            'Health Tips',
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
            'Blood Requests',
            style: TextStyle(color: Color(0xFFC2262F), fontSize: 18),
          ),
          SizedBox(height: 10),
          Expanded(
            // height: 300,
            child: Column(
              children: <Widget>[
                FutureBuilder(
                    future: Firestore.instance
                        .collection('B Positive')
                        .where('location', isEqualTo: 'Madaraka')
                        .getDocuments(),
                    builder: (context, snapshot) {
                      if (snapshot.data.documents == null) {
                        return CircularProgressIndicator();
                      } else 
                      if (snapshot.data.documents.isEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                      }
                      if (snapshot.data.documents == null) {
                        setState(() {
                          isLoading = true;
                        });
                        return Text('data');
                      }

                      if (snapshot.data.documents != null) {
                        final bloodRequests = snapshot.data.documents as List;
                        print(bloodRequests);
                        print('🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛');
                        if (snapshot.data.documents == null) {
                          setState(() {
                            isLoading = true;
                          });
                          return Text('data');
                        }
                        return (isLoading)
                            ? Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Color(0xFFC2262F),
                                ),
                              )
                            : Expanded(
                                child: Scrollbar(
                                  child: ListView.builder(
                                      itemCount: bloodRequests.length,
                                      itemBuilder: (contex, int index) {
                                        final bloodGroup =
                                            bloodRequests[index]['bloodGroup'];
                                        final userName =
                                            bloodRequests[index]['userName'];
                                        final requestUrgency =
                                            bloodRequests[index]
                                                ['requestUrgency'];
                                        final dropOffHospital =
                                            bloodRequests[index]
                                                ['dropOffHospital'];
                                        final location =
                                            bloodRequests[index]['location'];

                                        return Column(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Container(
                                              height: 250,
                                              width: double.infinity,
                                              child: Card(
                                                elevation: 2,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              right: 20,
                                                              bottom: 10,
                                                              left: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFFC2262F),
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            80),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: Color(
                                                                        0xFFC2262F),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                  toBeginningOfSentenceCase(
                                                                      userName))
                                                            ],
                                                          ),
                                                          (requestUrgency ==
                                                                  'Urgent')
                                                              ? Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFC2262F),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          10),
                                                                    ),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      requestUrgency,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0,
                                                              left: 20,
                                                              bottom: 10,
                                                              top: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons
                                                                  .person_pin_circle,
                                                              color: Color(
                                                                  0xFFC2262F)),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              'Blood Group',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black45),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              bloodGroup,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0,
                                                              left: 20,
                                                              bottom: 5,
                                                              top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons
                                                                  .local_hospital,
                                                              color: Color(
                                                                  0xFFC2262F)),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              'Hospital',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black45),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              toBeginningOfSentenceCase(
                                                                  dropOffHospital),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0,
                                                              left: 20,
                                                              bottom: 5,
                                                              top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.location_on,
                                                              color: Color(
                                                                  0xFFC2262F)),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              'Location',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black45),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              location,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 20.0,
                                                                left: 20,
                                                                bottom: 5,
                                                                top: 5),
                                                        child: Container(
                                                          height: 40,
                                                          width:
                                                              double.infinity,
                                                          child: MaterialButton(
                                                            height: 40,
                                                            onPressed: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  Routes
                                                                      .bloodRequestDetailPage);
                                                            },
                                                            child: Text(
                                                              'View Request',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            color: Color(
                                                                0xFFC2262F),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10),
                                                              ),
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ]);
                                      }),
                                ),
                              );
                      }
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Color(0xFFC2262F)),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  const BloodRequestCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: MaterialButton(
                      height: 40,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.bloodRequestDetailPage);
                      },
                      child: Text(
                        'View Request',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFFC2262F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
