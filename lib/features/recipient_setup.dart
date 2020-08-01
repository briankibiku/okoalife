import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';
import 'package:okoalife/shared/authentication_handler.dart';

import '../routes.dart';

class RecipientSetup extends StatefulWidget {
  @override
  _RecipientSetupState createState() => _RecipientSetupState();
}

class _RecipientSetupState extends State<RecipientSetup> {
  SignedInUserCridentials signedInUserCridentials = SignedInUserCridentials();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController location = TextEditingController();
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
  String selectedItem;
  bool isSelected;
  bool isExpenseFilled;
  bool isItemFilled;
  bool isLoading = false;
  String selectedLocationItem;
  bool isLocationSelected;

  bool firstNameFilled = false;
  bool secondNameFilled = false;
  bool phoneNumberFilled = false;
  bool bloodTypeFilled = false;
  bool locationFilled = false;
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
                  OkoaLifeAppBar(title: 'Recipient Details Page'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView(children: <Widget>[
                        FormTitle(title: 'First Name'),
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
                            controller: firstName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2262F),
                                  width: 2.0,
                                ),
                              ),
                              // suffixIcon: Icon(Icons.search),
                              labelText: 'First name',
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
                        FormTitle(title: 'Second Name'),
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
                                secondNameFilled = true;
                              });
                            },
                            controller: secondName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFC2262F),
                                  width: 2.0,
                                ),
                              ),
                              // suffixIcon: Icon(Icons.search),
                              labelText: 'Second name',
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
                            value: selectedItem,
                            iconEnabledColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value;
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
                                  !secondNameFilled ||
                                  !phoneNumberFilled ||
                                  !bloodTypeFilled ||
                                  !locationFilled) {
                                _displaySnackBar(context,
                                    'Make sure all fields are filled before saving');
                              }
                              if (firstNameFilled &&
                                  secondNameFilled &&
                                  phoneNumberFilled &&
                                  bloodTypeFilled &&
                                  locationFilled) {
                                setState(() {
                                  isLoading = true;
                                });

                                final recipientPayload = {
                                  'firstName': firstName.text,
                                  'secondName': secondName.text,
                                  'email': signedInUserCridentials.email.value,
                                  'phoneNumber': phoneNumber.text,
                                  'bloodType': selectedItem.toString(),
                                  'location': selectedLocationItem.toString()};

                                await Firestore.instance
                                    .collection('recipient')
                                    .document(
                                        '${signedInUserCridentials.email.value.toString()}')
                                    .setData({
                                  'recipient': [recipientPayload],
                                }); 
                                await Firestore.instance
                                    .collection('signed_up_users')
                                    .document(
                                        '${signedInUserCridentials.email.value.toString()}')
                                    .setData({
                                  'email': signedInUserCridentials.email.value,
                                  'userType': 'Recipient',
                                  'hasCompletedSignUp': true,
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
