import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myfriend/screens/add_friends.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade500,
        actions: [

          PopupMenuButton(onSelected: (value){
            print(value);
          },
            itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(child: ListTile(
                leading: Text('Sort By BFF',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              ),

              PopupMenuItem(child: ListTile(
                leading: Text('Sort By Gender',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              ),

            ];
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Addfriends(),));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),

    );

  }
}
