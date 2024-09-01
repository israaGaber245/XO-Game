import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonXO extends StatelessWidget{
  String input;
  int index;
 Function OnButton;
  ButtonXO({required this.input,required this.OnButton,required this.index});
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Container(
          padding: EdgeInsets.all(4),
          child: ElevatedButton(
              onPressed: (){
                OnButton(index);
              },
              child: Text('${input}',style: TextStyle(fontSize: 30),)),
        ));
  }

}