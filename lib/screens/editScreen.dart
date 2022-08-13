import 'package:flutter/material.dart';

import '../common/customTextfield.dart';

class EditScreen extends StatelessWidget {
  //const EditScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit New Friend'),
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
                Text('Gender'),
                Row(
                  children: [
                    //RadioButton(),

                    Text('Male'),
                  ],
                ),
                Row(
                  children: [
                    //RadioButton(),

                    Text('Female')
                  ],
                )

              ],
            ),

            SizedBox(
              height: 30,
            ),

            MaterialButton(onPressed: (){},
              child: Text('Submit'),
              color: Colors.orange,

            ),

          ],
        ),
      ),
    );
  }
}
