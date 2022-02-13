import 'dart:convert';

import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:http/http.dart' as http;

import '../DataFile.dart';
class Excercisetime extends StatefulWidget {
  @override
  _ExcercisetimeState createState() => _ExcercisetimeState();
}

class _ExcercisetimeState extends State<Excercisetime> {

  String datas;
  Future<String> updatuser() async {

  print(userID);
  print(Goalls);
  print(Genders);
  print(Born);
  print(Tall);
  print(TallUnit);
  print(Weights);
  print(WeightUnit);
  print(ExDays);


    final response = await http.post(Uri.parse(URL+'updateuser.php'), body: {
      "userid": userID,
      "goal": Goalls,
      "gender": Genders,
      "dob": Born,
      "tall": Tall,
      "tallunit": TallUnit,
      "weight": Weights,
      "weightunit": WeightUnit,
      "oftenexercise": ExDays.toString(),
    });
    if (response.statusCode == 200) {
      datas = json.decode(response.body);
      print(datas);
      return datas;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

  @override
  double _value = 5.0;

  Widget build(BuildContext context) {
    ExDays=5.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Step 5 of 5',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(child: Text("How often do you exercise?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),)),
          SizedBox(height: 30,),
          Center(child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text("On average, I exercise 4-5 times per\nweek",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: text,fontSize: 18),),
          )),
          SizedBox(height: 30,),
          SfSlider(
            activeColor:Colors.black,
            min: 1.0,
            max: 6.0,
            value: _value,
            interval: 1,
           showLabels: true,
            showDividers: true,

            minorTicksPerInterval: 0,
            onChanged: (dynamic value){
              setState(() {
                _value = value;
                ExDays=value.roundToDouble();
              });
             // double extra=double.parse(value).roundToDouble();

              print (value.roundToDouble());
            },
          ),
          SizedBox(height: 70,),
          Center(
            child:   ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProgressButton(
                  height: 59,
                  borderRadius: 8,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: blue,
                  defaultWidget: const Text(
                    "Finish",
                    style: TextStyle(color: Colors.white , fontSize: 16 ),
                  ),
                  progressWidget: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                  onPressed: () async{
                    String answer=await updatuser();
                    if(answer=="yes"){
                      print("successfulkl");
                      Navigator.pushNamed(context, 'Homescreen');
                    }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Error :: please try again later")));
                    }

                  },
                ),
              ],
            ),
          ),        ],
      ),
    );
  }
}
