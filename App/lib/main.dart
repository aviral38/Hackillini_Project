import 'package:flutter/material.dart';
import 'package:hackathon/first_page.dart';
import 'package:hackathon/items/postItem.dart';
import 'package:hackathon/items/search_page.dart';
import 'package:hackathon/login.dart';
import 'package:hackathon/signUp_page.dart';
import 'package:hackathon/user_first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/':(context)=>first_page(),
          '/signUp':(context)=>signUp(),
          '/userPage':(context)=>userFirstPage(),
          '/login':(context)=>login_page(),
          '/postItem':(context)=>post_item(),

        }
    );
  }
}
