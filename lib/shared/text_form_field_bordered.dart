import 'package:flutter/material.dart';

class TextFormFieldBordered extends StatelessWidget {
  const TextFormFieldBordered({
    this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      onChanged: (_) {},
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            color: Colors.cyan,
            width: 2.0,
          ),
        ),
        fillColor: Colors.white,
        focusColor: Colors.white,
        labelText: 'Expense type',
        labelStyle:
            Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.cyan),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
      ),
    );
  }
}
