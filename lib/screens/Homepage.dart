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

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 90,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ananya',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    Text('67',
                      style: TextStyle(
                          fontSize: 25
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                   IconButton(onPressed: (){}, icon: Icon(Icons.edit)),

                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),

                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                  ],
                )
              ],
            ),
          ),
        ),
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
