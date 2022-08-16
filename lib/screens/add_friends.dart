import 'package:flutter/material.dart';
import 'package:myfriend/common/customTextfield.dart';
import 'package:myfriend/common/radioButton.dart';

class Addfriends extends StatelessWidget {
  // Addfriends({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Friend'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Name",
              controller: nameController,
            ),

            SizedBox(
              height: 40,
            ),

            CustomTextField(
              label: "Age",
              controller: ageController,
            ),

            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gender',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                Radio(value: null, groupValue: null, onChanged: null),
                Text('Male',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),

                Radio(value: null, groupValue: null, onChanged: null),
                Text('Female',
                  style: TextStyle(
                      fontSize: 18
                  ),
                )

              ],
            ),

        SizedBox(
          height: 30,
        ),

            MaterialButton(onPressed: (){},
              child: Text('Submit',
                style: TextStyle(color: Colors.white,
                  fontSize: 18
                ),
              ),
              color: Colors.orange,

            ),

          ],
        ),
      ),
    );
  }
}
