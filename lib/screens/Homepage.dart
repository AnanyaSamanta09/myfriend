import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myfriend/controllers/addFriendController.dart';
import 'package:myfriend/models/friendModel.dart';
import 'package:myfriend/screens/add_friends.dart';
import 'package:myfriend/screens/editScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  bool isMyBestFriend = false;
  friendCard(BuildContext context, FriendModel friend) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  Text(
                    friend.name,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    friend.age.toString(),
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    friend.gender,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen()));
                  }, icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        isMyBestFriend = true;
                      },
                      icon: Icon(Icons.favorite_border)),
                  Consumer<FriendController>(
                    builder: (context, controller, child) {
                      return IconButton(onPressed: () {
                        controller.removeFriends(friend.id);
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
