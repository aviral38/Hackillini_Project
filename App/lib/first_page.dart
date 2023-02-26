import 'package:flutter/material.dart';
import 'package:hackathon/buttons/first_page_buttons.dart';

class first_page extends StatefulWidget {
  const first_page({Key? key}) : super(key: key);

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xff4568dc),
                Color(0xffb06ab3)
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  buttons_first( text: 'Sign up',next_page: '/signUp',),
                  SizedBox(height: 15,),
                  buttons_first( text: 'Login',next_page: '/login',),
                  SizedBox(height: 15,),
                  buttons_first( text: 'Login as Seller',next_page: '/',),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
