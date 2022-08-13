import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  String? gender;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      // title: Text("Male"),
      value: "male",
      groupValue: gender,
      onChanged: (value){
        setState(() {
          gender = value.toString();
        });
      },
    );
  }
}
