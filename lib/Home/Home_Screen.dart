
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Calculator app",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: Column(
        children: [

          Expanded(
              child: Container(
                padding: EdgeInsets.all(25.0),
                alignment: Alignment.bottomRight,
                child: Text(text,style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,

                ),),

              )
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              custombuildInkWell("9"),
              custombuildInkWell("8"),
              custombuildInkWell("7"),
              custombuildInkWell("+"),

            ],
          ),
          Row(
            children: [
              custombuildInkWell("6"),
              custombuildInkWell("5"),
              custombuildInkWell("4"),
              custombuildInkWell("-"),

            ],
          ),
          Row(
            children: [
              custombuildInkWell("3"),
              custombuildInkWell("2"),
              custombuildInkWell("1"),
              custombuildInkWell("*"),

            ],
          ),
          Row(
            children: [
              custombuildInkWell("C"),
              custombuildInkWell("<"),

              custombuildInkWell("0"),
              custombuildInkWell("="),

              custombuildInkWell("/"),

            ],
          ),



        ],
      ),
    );
  }

  Widget custombuildInkWell(String val) {
    return Expanded(
      child: InkWell(
        onTap: ()=> btnClicked(val),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: 50,
            height: 50,
            child: Center(
              child: Text(val,style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),),
            ),
          ),
        ),
      ),
    );
  }


  late int first,second;
  late String result,text="";
  late String opp;
  void btnClicked(String btntext){
    if(btntext=="C"){
      result="";
      text="";
      first=0;
      second=0;


    }else if(btntext=="<"){
      if(result.isNotEmpty){
        result=result.substring(0,result.length-1);
        opp="0";
      }
    }
    else if(btntext=="+"|| btntext=="-"|| btntext=="*"|| btntext=="/" ){
      first=int.parse(text);
      result="";
      opp=btntext;

    }else if(btntext=="="){
      second=int.parse(text);
      if(opp=="+"){
        result=(first + second).toString();
      }
      if(opp=="-"){
        result=(first - second).toString();
      }
      if(opp=="*"){
        result=(first * second).toString();

      }
      if(opp=="/"){
        result=(first / second).toString();
      }
    }
    else{
      result=text+btntext;

    }

    setState(() {
      text=result;
    });

  }
}
