import 'package:flutter/material.dart';
import 'package:myfriend/controllers/addFriendController.dart';
import 'package:myfriend/screens/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:myfriend/screens/editScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(context)=>FriendController())],
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
