import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myfriend/controllers/FriendController.dart';
import 'package:myfriend/models/friendModel.dart';
import 'package:myfriend/screens/add_friends.dart';
import 'package:myfriend/screens/editScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  friendCard(BuildContext context, FriendModel friend) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Image.asset(friend.gender=='M'?'assets/boy.png':'assets/girl.png',height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friend.name,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    friend.age.toString(),
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditFriendScreen(f: friend),));
                      },
                      icon: Icon(Icons.edit)),
                  Consumer<FriendController>(
                    builder: (BuildContext context, controller, child) {
                      return IconButton(
                          onPressed: () {
                            if (friend.isbff) {
                              controller.removeBff(friend.id);
                            } else {
                              controller.addBff(friend.id);
                            }
                          },
                          icon: Icon(friend.isbff
                              ? Icons.favorite
                              : Icons.favorite_border));
                    },
                  ),
                  Consumer<FriendController>(
                    builder: (context, controller, child) {
                      return IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Delete',
                                    ),
                                    content: Text('Delete Task ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            controller.removeFriends(friend.id);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete'))
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.delete));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade500,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: Text(
                      'Sort By BFF',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Text(
                      'Sort By Gender',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Consumer<FriendController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return friendCard(context, controller.friends[index]);
            },
            itemCount: controller.friends.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addfriends(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
