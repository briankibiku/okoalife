import 'package:flutter/material.dart';
import 'package:okoalife/features/user_type.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
          child: Column(
            children: <Widget>[
              OkoaLifeAppBar(title: 'Healthy Read'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 6,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        'Food to avoid while donating blood regularly',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                        overflow: TextOverflow.visible,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Many pieces of research on blood donation have revealed that by donating blood, you remain physically and mentally healthy. That is why World Blood Donor Day is celebrated every year on 14 June, so that people become more aware of donating blood. Every time you donate blood or platelets, you’re helping someone with cancer, trauma, premature babies or organ transplants; among many other conditions. It is recommended that you maintain a nutritious, well-balanced diet to donate blood. Here are some tips on foods to avoid, foods to eat, before and after you donate blood. ',
                    style: TextStyle(letterSpacing: 1),
                  ))
            ],
          ),
        ));
  }
}
