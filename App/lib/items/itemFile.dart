import 'package:flutter/material.dart';
class item extends StatefulWidget {
  String itemName;
  String price;
  String description;
  item({required this.itemName, required this.price, required this.description});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Material(child: Column(
      children: [
        Image.network('https://www.pngitem.com/pimgs/m/474-4744908_sports-items-images-hd-hd-png-download.png'),
        Text(widget.itemName.toString()),
        Text('Price: '+widget.price.toString()),
        Row(
          children: [
            Text('Description: '),
            Text(widget.description),
          ],
        ),
        MaterialButton(onPressed: (){},child: Text('Request'),)

      ],
    ),);
  }
}
