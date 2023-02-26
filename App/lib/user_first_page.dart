import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathon/items/itemFile.dart';
import 'package:hackathon/items/search_page.dart';

class userFirstPage extends StatefulWidget {
  const userFirstPage({Key? key}) : super(key: key);

  @override
  State<userFirstPage> createState() => _userFirstPageState();
}

class _userFirstPageState extends State<userFirstPage> {
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
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>search_page(name:_textEditingController.text ,)));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [MaterialButton(child: Icon(Icons.search),onPressed: _toggleTextFieldVisibility,)],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text('Sell Items'),
                onPressed: () {
                  Navigator.pushNamed(context, '/postItem');
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text('Pending Requests'),
                onPressed: () {
                  //Navigator.pushNamed(context, '/postItem');
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
      var params={"longitude":position.longitude,"latitude":position.latitude,"threshold":50};
      final dio = Dio();
      List data=[];
      final response=await dio.patch('http://10.0.2.2:8000/item/getAll',data: jsonEncode(params)).then((value)  {
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
