import 'package:flutter/material.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6DCE75),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.home, color: Colors.black54),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.info, color: Colors.black54),
                  onPressed: () { 
                  }),
              IconButton(
                  icon: Icon(Icons.person, color: Colors.black54),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black54),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.shoppingCart);
                  })
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {}),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/app_logo_white.png'),
                        height: 40,
                        width: 70,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/app_logo.png'),
                            height: 100,
                            width: 130,
                          ),
                          Text(
                            'MyDoorstep',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Tap . Order . We deliver',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, top: 30.0),
                            child: Text(
                              'Hello Kim...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              'What will you order today?',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.gasSuppliers);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/gas.png'),
                                            height: 60,
                                            width: 90,
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 1,
                                          decoration: BoxDecoration(
                                              color: Colors.black26
                                              // border:  Border.all(width: , ),
                                              ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Text('Gas'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.liquorStores);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/beer.png'),
                                            height: 60,
                                            width: 90,
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 1,
                                          decoration: BoxDecoration(
                                              color: Colors.black26
                                              // border:  Border.all(width: , ),
                                              ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Text('Liquor'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
