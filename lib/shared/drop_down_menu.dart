
import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  const DropdownMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: 'selectedItem',
      iconEnabledColor: Colors.white,
      onChanged: (value) {},
      hint: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
        child: Text(
          'Item',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.cyan,
          ),
        ),
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.cyan,
      ),
      items: ['Tonnes', 'Packets', 'Kgs'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.cyan,
              ),
            ),
          ),
        );
      }).toList(),
      decoration: InputDecoration(border: InputBorder.none),
    );
  }
}
