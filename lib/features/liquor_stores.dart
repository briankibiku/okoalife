import 'package:flutter/material.dart';

class LiquorStores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6DCE75),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0, color: Colors.white60),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40))),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Liquor Stores',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            Image(
                              image: AssetImage(
                                  'assets/images/app_logo_white.png'),
                              height: 40,
                              width: 70,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Scrollbar(
                          child: ListView(
                            children: <Widget>[
                              LiquorStoreCard(
                                liquorStoreName: 'Whiskey farm',
                                liquorStoreLocation: 'Mwimuto/Kitisuru',
                              ),
                              SizedBox(width: 20.0),
                              LiquorStoreCard(
                                liquorStoreName: 'Saki wines & spirit',
                                liquorStoreLocation: 'Wangige',
                              ),
                              SizedBox(width: 20.0),
                              LiquorStoreCard(
                                liquorStoreName: 'Whiskey farm',
                                liquorStoreLocation: 'Mwimuto/Kitisuru',
                              ),
                              SizedBox(width: 20.0),
                              LiquorStoreCard(
                                liquorStoreName: 'Whiskey farm',
                                liquorStoreLocation: 'Mwimuto/Kitisuru',
                              ),
                              SizedBox(width: 20.0),
                              LiquorStoreCard(
                                liquorStoreName: 'Whiskey farm',
                                liquorStoreLocation: 'Mwimuto/Kitisuru',
                              ),
                              SizedBox(width: 20.0),
                            ],
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
    );
  }
}

class LiquorStoreCard extends StatelessWidget {
  const LiquorStoreCard(
      {@required this.liquorStoreName, @required this.liquorStoreLocation});
  final String liquorStoreName;
  final String liquorStoreLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80,
        width: double.infinity,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/whiskey.jpg'))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        liquorStoreName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Image(
                              height: 10,
                              width: 10,
                              image: AssetImage('assets/images/location.png'),
                              color: Colors.black45),
                          Text(liquorStoreLocation,
                              style: TextStyle(color: Colors.black54,
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.black45,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
