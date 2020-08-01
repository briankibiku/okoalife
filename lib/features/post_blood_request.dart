import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';
import 'package:okoalife/shared/authentication_handler.dart';

import '../routes.dart';

class PostBloodRequestPage extends StatefulWidget {
  @override
  _PostBloodRequestPageState createState() => _PostBloodRequestPageState();
}

class _PostBloodRequestPageState extends State<PostBloodRequestPage> {
  SignedInUserCridentials signedInUserCridentials = SignedInUserCridentials();

  final TextEditingController userName = TextEditingController();
  final TextEditingController dropOffLocation = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController location = TextEditingController();
  final List<String> urgencyList = ['Urgent', 'Not Urgent'];
  final List<String> items = [
    'A  Positive',
    'A Negative',
    'B Positive',
    'B Negative',
    'O Negative',
    'O Positive',
  ];
  final List<String> nairobiLocations = [
    'Madaraka',
    'Kasarani',
    'Kilimani',
    'Mukuru',
    'Pipeline',
    'Embakasi',
    'Donholm',
    'Thome',
    'Woodley'
  ];
  String bloodGroup;
  bool isSelected;
  bool isExpenseFilled;
  bool isItemFilled;
  bool isLoading = false;
  String selectedLocationItem;
  bool isLocationSelected;

  bool firstNameFilled = false;
  bool dropOffLocationFilled = false;
  bool phoneNumberFilled = false;
  bool bloodTypeFilled = false;
  bool locationFilled = false;

  String requestUrgency;
  bool requestUrgencyFilled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Builder(
        builder: (context) => (isLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(children: <Widget>[
                  OkoaLifeAppBar(title: 'Post Blood Request'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView(children: <Widget>[
                        FormTitle(title: 'Your Name'),
                        SizedBox(height: 15.0),
                        Container(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Color(0xFFC2262F),
                            ),
                            onChanged: (_) {
                              setState(() {
                                isExpenseFilled = true;
                                firstNameFilled = true;
                              });
                            },
                            controller: userName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2262F),
                                  width: 2.0,
                                ),
                              ),
                              // suffixIcon: Icon(Icons.search),
                              labelText: 'Your name',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xFFC2262F)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        FormTitle(title: 'Phone Number'),
                        SizedBox(height: 15.0),
                        Container(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Color(0xFFC2262F),
                            ),
                            onChanged: (_) {
                              setState(() {
                                isExpenseFilled = true;
                                phoneNumberFilled = true;
                              });
                            },
                            controller: phoneNumber,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2262F),
                                  width: 2.0,
                                ),
                              ),
                              // suffixIcon: Icon(Icons.search),
                              labelText: 'Phone Number',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xFFC2262F)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        FormTitle(title: 'Blood Type'),
                        SizedBox(height: 15.0),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFC2262F)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: requestUrgency,
                            iconEnabledColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                requestUrgency = value;
                                isSelected = true;
                                requestUrgencyFilled = true;
                              });
                            },
                            hint: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Request Urgency',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color(0xFFC2262F),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFFC2262F),
                            ),
                            items: urgencyList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Color(0xFFC2262F),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        FormTitle(title: 'Request Urgency'),
                        SizedBox(height: 15.0),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFC2262F)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: bloodGroup,
                            iconEnabledColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                bloodGroup = value;
                                isSelected = true;
                                bloodTypeFilled = true;
                              });
                            },
                            hint: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Blood Group',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color(0xFFC2262F),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFFC2262F),
                            ),
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Color(0xFFC2262F),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        FormTitle(title: 'Drop off Hospital'),
                        SizedBox(height: 15.0),
                        Container(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Color(0xFFC2262F),
                            ),
                            onChanged: (_) {
                              setState(() {
                                isExpenseFilled = true;
                                dropOffLocationFilled = true;
                              });
                            },
                            controller: dropOffLocation,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2262F),
                                  width: 2.0,
                                ),
                              ),
                              // suffixIcon: Icon(Icons.search),
                              labelText: 'Drop off Hospital',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Color(0xFFC2262F)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        FormTitle(title: 'Location'),
                        SizedBox(height: 15.0),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFC2262F)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: DropdownButtonFormField(
                            value: selectedLocationItem,
                            iconEnabledColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selectedLocationItem = value;
                                isLocationSelected = true;
                                locationFilled = true;
                              });
                            },
                            hint: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Location',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color(0xFFC2262F),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFFC2262F),
                            ),
                            items: nairobiLocations.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Color(0xFFC2262F),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 56,
                          width: double.infinity,
                          child: MaterialButton(
                            height: 56,
                            onPressed: () async {
                              if (!firstNameFilled ||
                                  !dropOffLocationFilled ||
                                  !phoneNumberFilled ||
                                  !bloodTypeFilled ||
                                  !requestUrgencyFilled ||
                                  !locationFilled) {
                                _displaySnackBar(context,
                                    'Make sure all fields are filled before saving');
                              }
                              if (firstNameFilled &&
                                  dropOffLocationFilled &&
                                  phoneNumberFilled &&
                                  bloodTypeFilled &&
                                  requestUrgencyFilled &&
                                  locationFilled) {
                                setState(() {
                                  isLoading = true;
                                });

                                // final recipientPayload = {
                                //   'userName': userName.text,
                                //   'phoneNumber': phoneNumber.text,
                                //   'bloodGroup': bloodGroup.toString(),
                                //   'requestUrgency': requestUrgency.toString(),
                                //   'dropOffHospital': dropOffLocation.text,
                                //   'location': selectedLocationItem.toString(),
                                // };

                                await Firestore.instance
                                    .collection(bloodGroup.toString())
                                    .add({
                                  'userName': userName.text,
                                  'phoneNumber': phoneNumber.text,
                                  'bloodGroup': bloodGroup.toString(),
                                  'requestUrgency': requestUrgency.toString(),
                                  'dropOffHospital': dropOffLocation.text,
                                  'location': selectedLocationItem.toString(), 
                                }); 
                                setState(() {
                                  isLoading = true;
                                });
                                await Navigator.popAndPushNamed(
                                    context, Routes.recipientHomePage);
                              }
                            },
                            color: Color(0xFFC2262F),
                            child: Text(
                              'Submit Details',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ),
      ),
    );
  }
}

_displaySnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0))),
    content: Text(message),
    duration: Duration(seconds: 2),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

class FormTitle extends StatelessWidget {
  const FormTitle({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
