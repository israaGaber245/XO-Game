import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xogames/XOGame.dart';
import 'package:xogames/login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO',
      initialRoute:Login.RoutName,
      routes:{ Login.RoutName:(context)=>Login(),
      XOGame.RoutName:(context)=>XOGame()},
      home: Login(),
    );
  }

}
