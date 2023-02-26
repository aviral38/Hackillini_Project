import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/TextField/textField_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
          children: [
            SizedBox(height: height*0.25,),

            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 15,),
                Text('Email: '),
                SizedBox(width:10),
                Container(child: TextFieldWidget(hintText: 'Enter Email Address',myController: emailController,),width: width*0.75,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 15,),
                Text('Password: '),
                SizedBox(width:10),
                Container(child: TextFieldWidget(hintText: 'Enter Password',myController: passwordController,),width: width*0.75,),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(500))
              ),
              child: MaterialButton(
                onPressed: () async{
                  final dio = Dio();
                  var params={"email":emailController.text, "password":passwordController.text};
                  print(params);
                  final response=await dio.post('http://10.0.2.2:8000/user/login',data: jsonEncode(params)).then((value) async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('uid', value.toString());
                    Navigator.pushNamed(context, '/userPage');
                      print(value.statusCode);}).catchError((err)=>{print(err.toString() +' eroro is')});
                  print("hello");

                  // print(response.data);

                },child: Center(
                child: Row(
                  children: [
                    Text('Login',style: TextStyle(color: Color(0xfffba919)),),
                    SizedBox(width: 25,),
                  ],
                ),
              ),
                color: Color(0xff300c38),),
            ),
          ],
        ),
      ),
    );
  }
}
