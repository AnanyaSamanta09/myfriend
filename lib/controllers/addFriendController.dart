import 'package:flutter/material.dart';

import '../models/friendModel.dart';

class FriendController extends ChangeNotifier{
  List<FriendModel> friends =[];

  void addNewFriends(String name,int age,String gender) {
    FriendModel f = FriendModel(name: name, age: age, gender: gender, id: DateTime.now().toString());
    friends.add(f);
    notifyListeners();
  }


}