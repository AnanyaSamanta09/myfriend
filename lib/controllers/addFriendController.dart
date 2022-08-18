import 'package:flutter/material.dart';

import '../models/friendModel.dart';

class FriendController extends ChangeNotifier{
  List<FriendModel> friends =[];

  void addNewFriends(String name,int age,String gender) {
    FriendModel f = FriendModel(name: name, age: age, gender: gender, id: DateTime.now().toString(), isbff: false);
    friends.add(f);
    notifyListeners();
  }

  void removeFriends(String id){
    int index = friends.indexWhere((element) => element.id==id);
    friends.removeAt(index);
    notifyListeners();
  }

  void addBff(String id){
    int index = friends.indexWhere((element) => element.id==id);
    friends[index].markBff();
    notifyListeners();
  }

  void removeBff(String id){
    int index = friends.indexWhere((element) => element.id==id);
    friends[index].unmarkBff();
    notifyListeners();
  }
}