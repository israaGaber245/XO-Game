import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xogames/XOGame.dart';

class Login extends StatelessWidget{
 static String RoutName='login';
 String player1Name='';
 String player2Name='';
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Start Page'),
       centerTitle: true,
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           TextField(
             onChanged: (text){
               player1Name=text;
             },
             decoration: InputDecoration(
               label: Text('Player1Name'),
             ),
           ),
           TextField(
             onChanged: (text){
               player2Name=text;
             },
             decoration: InputDecoration(
               label: Text('Player2Name'),
             ),
           ),
           ElevatedButton(onPressed: (){
             Navigator.of(context).pushNamed(XOGame.RoutName,
                 arguments:XOGameArgs(playerName1: player1Name, playerName2: player2Name) );
           }, child: Text("Let's Play"))
         ],
       ),
     ),
   );
  }

}