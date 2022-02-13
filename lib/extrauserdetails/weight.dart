import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../DataFile.dart';

class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  int weightselected = 2;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  final _weightvalue = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Step 4 of 5',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(child: Text("What is your weight?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),)),
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
                      controller: _weightvalue,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please Enter Weight";
                        }else if((int.parse(value)<66 ||int.parse(value)>12) && weightselected==1){
                          return 'Allowed 66-900 LBS';
                        }else if((int.parse(value)<30 ||int.parse(value)>400) && weightselected==2){
                          return 'Allowed 30-400 KG';
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
                          hintText: 'Weight',
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
              weightselected ==1?   InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("LBS",style: TextStyle(color: blue,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: blue),
                  ),
                ),
                onTap: (){
                  setState(() {
                    weightselected =1;
                  });
                },
              ):InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("LBS",style: TextStyle(color: text,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: text),
                  ),
                ),
                onTap: (){
                  setState(() {
                    weightselected =1;
                  });
                },
              ),
              weightselected ==2?  InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("KG",style: TextStyle(color: blue,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: blue),
                  ),
                ),
                onTap: (){
                  setState(() {
                    weightselected =2;
                  });
                },
              ):InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(child: Text("KG",style: TextStyle(color: text,fontSize: 16),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: text),
                  ),
                ),
                onTap: (){
                  setState(() {
                    weightselected =2;
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
                      Weights=_weightvalue.text;
                      if(weightselected==1){
                        WeightUnit="LBS";
                      }else{
                        WeightUnit="KG";
                      }
                      Navigator.pushNamed(context, 'Excercisetime');
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
