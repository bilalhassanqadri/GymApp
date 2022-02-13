import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../DataFile.dart';

class Height extends StatefulWidget {
  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override
  int heightselected = 1;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _heightvalue = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Step 3 of 5',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(child: Text("How tall are you?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),)),
          SizedBox(height: 30,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  child: Form(
                    key: formkey,
                    child: TextFormField(
                      controller: _heightvalue,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please Enter Height";
                        }else if((int.parse(value)<2 ||int.parse(value)>12) && heightselected==1){
                          return 'Allowed 2-12 FT';
                        }else if((int.parse(value)<60 ||int.parse(value)>400) && heightselected==2){
                          return 'Allowed 60-400 CM';
                        }
                        else{
                          return null;
                        }
                      },
                      autofocus: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      style: TextStyle(
                          fontSize: 40.0,
                          height: 2.0,
                          color: blue
                      ),
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Height',
                          hintStyle: TextStyle(fontSize: 40)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              heightselected ==1?   InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("Ft",style: TextStyle(color: blue,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: blue),
                  ),
                ),
                onTap: (){
                  setState(() {
                    heightselected =1;
                  });
                },
              ):InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("Ft",style: TextStyle(color: text,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: text),
                  ),
                ),
                onTap: (){
                  setState(() {
                    heightselected =1;
                  });
                },
              ),
              heightselected ==2?  InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("Cm",style: TextStyle(color: blue,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: blue),
                  ),
                ),
                onTap: (){
                  setState(() {
                    heightselected =2;
                  });
                },
              ):InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("Cm",style: TextStyle(color: text,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: text),
                  ),
                ),
                onTap: (){
                  setState(() {
                    heightselected =2;
                  });
                },
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  child: Container(
                    height: 50 ,
                    width: 50,
                    child: Icon(Icons.arrow_forward,color: blue,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color(0xFF0798C6).withOpacity(0.4),
                    ),
                  ),
                  onTap: (){
                    if(formkey.currentState.validate()){
                      Tall=_heightvalue.text;
                      if(heightselected==1){
                        TallUnit="Ft";
                      }else{
                        TallUnit="Cm";
                      }
                      Navigator.pushNamed(context, 'Weight');
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),

        ],
      ),
    );
  }
}
