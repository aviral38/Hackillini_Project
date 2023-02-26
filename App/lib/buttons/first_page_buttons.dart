import 'package:flutter/material.dart';
class buttons_first extends StatelessWidget {
  String text;
  String next_page;
  buttons_first({required this.text, required this.next_page});
  // const buttons_first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(500))
      ),
      child: MaterialButton(
        onPressed: (){
          Navigator.pushNamed(context, next_page);
        },child: Center(
        child: Row(
          children: [
            Text(text,style: TextStyle(color: Color(0xfffba919)),),
            SizedBox(width: 25,),
          ],
        ),
      ),
        color: Color(0xff300c38),),
    );
  }
}
