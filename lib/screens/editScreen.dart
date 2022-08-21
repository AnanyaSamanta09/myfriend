import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/customTextfield.dart';
import '../controllers/FriendController.dart';
import '../models/friendModel.dart';

class EditFriendScreen extends StatefulWidget {

  FriendModel f;
  EditFriendScreen({
    required this.f,
});

  @override
  State<EditFriendScreen> createState() => _EditFriendScreenState();
}

class _EditFriendScreenState extends State<EditFriendScreen> {
  String gender ='F';

  String bff ='N';

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController(text: widget.f.name);
    ageController = TextEditingController(text: widget.f.age.toString());
    gender = widget.f.gender;
  }

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
                          controller.editFriends(FriendModel(name: nameController.text, age: int.parse(ageController.text.toString()), gender: gender, id: widget.f.id, isbff: widget.f.isbff));
                          Navigator.pop(context);
                        }
                      },
                        child: Text('Edit',
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
