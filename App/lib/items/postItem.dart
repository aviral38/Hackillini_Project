import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathon/TextField/textField_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class post_item extends StatefulWidget {
  const post_item({Key? key}) : super(key: key);

  @override
  State<post_item> createState() => _post_itemState();
}

class _post_itemState extends State<post_item> {




  final itemController = TextEditingController();
  final descriptionController = TextEditingController();
  final costController = TextEditingController();
  final sellerNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: ListView(
      children: [
        Row(
        children: [
          Text('Item Name: '),
          Container(child: TextFieldWidget(hintText: 'Item Name',myController: itemController,),width: width*0.5,),
        ],
      ),
        Row(
          children: [
            Text('Cost: '),
            Container(child: TextFieldWidget(hintText: 'Cost',myController: costController,),width: width*0.5,),
          ],
        ),
        Row(
          children: [
            Text('Picture: '),
            Container(child: TextFieldWidget(hintText: 'Item Name',myController: costController,),width: width*0.5,),
          ],
        ),
        Row(
          children: [
            Text('Seller Name: '),
            Container(child: TextFieldWidget(hintText: 'Seller Name',myController: sellerNameController,),width: width*0.5,),
          ],
        ),
        Row(
          children: [
            Text('Description: '),
            Container(child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                focusColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Description of item',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              maxLines: 20,
              minLines: 1,
            ),width: width*0.5,),
          ],
        ),
        MaterialButton(child:Text("Add Item"),onPressed: () async {print('Hello');
          final prefs = await SharedPreferences.getInstance();
          var id=prefs.getString('uid');
          print(id);

          LocationPermission permission;
          permission = await Geolocator.requestPermission();
          Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

          final dio = Dio();
          var params={"cost":costController.text,"sellerName":sellerNameController.text,"itemName":itemController.text,"sid":id,"picture":costController.text,"description":descriptionController.text,"longitude":position.longitude,"latitude":position.latitude};
        print(params);
        final response=await dio.post('http://10.0.2.2:8000/item/addItem',data: jsonEncode(params)).then((value) async {
          Navigator.pushNamed(context, '/userPage');
          print(value.statusCode);}).catchError((err)=>{print(err.toString() +' eroro is')});
         })
      ],
        ),
    );
  }
}
