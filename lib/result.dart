import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(' Cancel & Go back',style: TextStyle(color: blue,fontSize: 14),)),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: new CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 10.0,
              percent: 0.78,
              center: new Text("78%",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: blue),),
              progressColor: blue,
            ),
          ),
          SizedBox(height: 10,),
          Text("Generating Results",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: blue),),
          SizedBox(height: 10,),
          Text("Sit back, it may take few minutes\nto compile results for you.",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: blue),),
        ],
      ),
    );
  }
}
