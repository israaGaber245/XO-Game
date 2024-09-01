import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ButtonXO.dart';

class XOGame extends StatefulWidget {
  static String RoutName='XO Game';
  @override
  State<XOGame> createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  List<String>ListInput=[
    '','','',
    '','','',
    '','',''
  ];
  int Score1=0;
  int Score2=0;

  @override
  Widget build(BuildContext context) {
    XOGameArgs args=ModalRoute.of(context)?.settings.arguments as XOGameArgs ;
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(4),
        child: Column(

          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('${args.playerName1}'), Text('${Score1}')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('${args.playerName2}'), Text('${Score2}')],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                ButtonXO( input:ListInput[0],OnButton:OnPress ,index:0 ),
                  ButtonXO( input:ListInput[1],OnButton:OnPress ,index:1 ),
                  ButtonXO( input:ListInput[2],OnButton:OnPress ,index:2 ),
              ],),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonXO( input:ListInput[3],OnButton:OnPress ,index:3 ),
                  ButtonXO( input:ListInput[4],OnButton:OnPress ,index:4 ),
                  ButtonXO( input:ListInput[5],OnButton:OnPress ,index:5 ),
                ],),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonXO( input:ListInput[6],OnButton:OnPress ,index:6 ),
                  ButtonXO( input:ListInput[7],OnButton:OnPress ,index:7 ),
                  ButtonXO( input:ListInput[8],OnButton:OnPress ,index:8 ),
                ],),
            ),
          ],
        ),
      ),
    );
  }

  int counter=0;

  void OnPress(int index){
    if(ListInput[index].isNotEmpty){
      return;
    }
    if(counter%2==0){
      ListInput[index]='x';
    }else{
      ListInput[index]= 'o';
    }
    counter++;
    if(Checked('x')){
      Score1+=5;
      initList();
    }else if(Checked('o')){
      Score2+=5;
      initList();
    }else if(counter==9){
      initList();
    }

    setState(() {

    });

  }
  bool Checked(String input){
    for(int i=0;i<9;i+=3){
      if(ListInput[i]==input &&ListInput[i+1]==input&&ListInput[i+2]==input){
        return true;
      }
    }
    for(int i=0;i<3;i+=1){
      if(ListInput[i]==input &&ListInput[i+3]==input&&ListInput[i+6]==input){
        return true;
      }
    }
    if(ListInput[0]==input &&ListInput[4]==input&&ListInput[8]==input){
      return true;
    }
    if(ListInput[2]==input &&ListInput[4]==input&&ListInput[6]==input){
      return true;
    }
    return false;
  }
  void initList(){
    ListInput=[
      '','','',
      '','','',
      '','',''
    ];
    counter=0;
  }
}
class XOGameArgs{
  String playerName1;
  String playerName2;
  XOGameArgs({required this.playerName1,required this.playerName2});

}
