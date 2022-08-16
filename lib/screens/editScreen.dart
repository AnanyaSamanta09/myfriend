import 'package:flutter/material.dart';

import '../common/customTextfield.dart';

class EditScreen extends StatefulWidget {
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  String gender ='F';
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
                Text('Gender',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Row(
                  children: [
                    Radio(value: 'M', groupValue: gender, onChanged: (value){
                      setState((){
                        gender='M';
                      });
                    }),

                    Text('Male',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 'F', groupValue: gender, onChanged: (value){
                      setState((){
                        gender='F';
                      });
                    }),

                    Text('Female',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    )
                  ],
                )

              ],
            ),

            SizedBox(
              height: 30,
            ),

            SizedBox(
              height: 60,
              width: 400,
              child: MaterialButton(
                onPressed: (){},
                child: Text('Submit',
                  style: TextStyle(color: Colors.white,
                      fontSize: 23
                  ),
                ),
                color: Colors.orange,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
