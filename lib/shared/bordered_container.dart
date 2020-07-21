import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF20232a),
          border: Border.all(width: 4, color: Color(0xFF5fd6f6)),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
    );
  }
}
