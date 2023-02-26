import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathon/items/itemFile.dart';
class search_page extends StatefulWidget {
  String name;
  search_page({required this.name});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  bool _isTextFieldVisible = false;
  TextEditingController _textEditingController = TextEditingController();
  void _toggleTextFieldVisibility() {
    setState(() {
      _isTextFieldVisible = !_isTextFieldVisible;
      if (!_isTextFieldVisible) {
        // Clear the text field when hiding it
        _textEditingController.clear();
      }
    });
  }

  void _onSearchButtonPressed() {
    // Perform search action here
    print("Searching for ${_textEditingController.text}");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [MaterialButton(child: Icon(Icons.search),onPressed: _toggleTextFieldVisibility,)],
        ),
        drawer: Drawer(
          child: Row(
            children: [
              MaterialButton(
                child: Text('Sell Items'),
                onPressed: () {
                  Navigator.pushNamed(context, '/postItem');
                },
              )
            ],
          ),
        ),
        body: FutureBuilder(
            future: getAll(),
            builder: (
                BuildContext context, AsyncSnapshot snapshot
                ){
              if(snapshot.hasData){
                print('kdfp');
                print(snapshot.data[0]['cost']);

                return ListView(
                  children: [
                    Visibility(
                      visible: _isTextFieldVisible,
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: "Search",
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: _onSearchButtonPressed,
                          ),
                        ),
                      ),
                    ),
                    for ( var data in snapshot.data) item(itemName: data['itemName'].toString(), price: data['cost'].toString(), description: data['description'].toString())
                    //ListView.builder(itemCount:l,itemBuilder: (context, index){return Container(child:Text("adif"));},)
                  ],
                );
              }
              else{
                return Center(child: Container(child: Text('None')));
              }
            }

        ),
      ),
    );
  }
  Future<List> getAll() async{
    try{
      LocationPermission permission;
      print('hello');

      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      var params={"longitude":position.longitude,"latitude":position.latitude,"threshold":50,"name":widget.name};
      final dio = Dio();
      List data=[];
      final response=await dio.patch('http://10.0.2.2:8000/item/findItem',data: jsonEncode(params)).then((value)  {
        print('it has value');
        value.data.forEach((val)=>{
          data.add(val)
        });
      }).catchError((err)=>{print(err.toString() +' eroro is')});
      return data;
    }catch(err)
    {
      return List.empty();
    }

  }
}
