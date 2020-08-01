import 'package:flutter/material.dart';

import '../routes.dart';

class UserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: <Widget>[
          OkoaLifeAppBar(title: 'User Type'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'I want to register as a?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.donorSetup);
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFC2262F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(80),
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/hand.png'),
                            height: 60,
                            width: 60,
                            color: Color(0xFFC2262F),
                          ),
                          Text(
                            'Donor',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.recipeintSetup);
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    child: Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFC2262F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(80),
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/hand.png'),
                            height: 60,
                            width: 60,
                            color: Color(0xFFC2262F),
                          ),
                          Text(
                            'Recepient',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OkoaLifeAppBar extends StatelessWidget {
  const OkoaLifeAppBar({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFC2262F),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/heart.png'),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 5),
                      Text('OkoaLife', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ]),
          ),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18))
        ],
      ),
    );
  }
}
