import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  CustomTextField({required this.controller,required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        decoration: InputDecoration(

          enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ) ,

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          labelText: label
        )
    );
  }
}
