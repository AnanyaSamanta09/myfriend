import 'package:flutter/material.dart';
import 'package:myfriend/common/customTextfield.dart';
import 'package:myfriend/controllers/addFriendController.dart';
import 'package:provider/provider.dart';

class Addfriends extends StatefulWidget {
  @override
  State<Addfriends> createState() => _AddfriendsState();
}

class _AddfriendsState extends State<Addfriends> {
  // Addfriends({Key? key}) : super(key: key);
  String gender ='F';
  String bff ='N';

  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                ),

            SizedBox(
              height: 20,
            ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Friend',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                    Radio(value: 'Y', groupValue: bff, onChanged: (value){
                      setState((){
                        bff='Y';
                      });
                    }),
                    Text('Yes',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),

                    Radio(value: 'N', groupValue: bff, onChanged: (value){
                      setState((){
                        bff='N';
                      });
                    }),
                    Text('No',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    )

                  ],
                ),

                SizedBox(
                  height: 30,
                ),


                SizedBox(
                  height: 60,
                  width: 400,
                  child: Consumer<FriendController>(
                    builder: (context, controller , child) {
                      return MaterialButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          controller.addNewFriends(nameController.text, int.parse(ageController.text.toString()), gender);
                          Navigator.pop(context);
                        }
                      },
                        child: Text('Submit',
                          style: TextStyle(color: Colors.white,
                              fontSize: 23
                          ),
                        ),
                        color: Colors.orange,

                      );
                    },

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
