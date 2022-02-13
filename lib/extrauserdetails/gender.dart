import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

import '../DataFile.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  int genderselect =1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Step 1 of 5',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(child: Text("What's your gender?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),)),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              genderselect ==1? InkWell(
                child: Container(
                  height: 100,
                  width: 100,
                  color: blue,
                  child: Card(
                    elevation: 5,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Icon(Icons.male,size: 50,),
                        SizedBox(height: 5,),
                        Text("Male",style: TextStyle(color: text,fontSize: 16),)
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    genderselect = 1;
                  });
                },
              ):InkWell(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    elevation: 5,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Icon(Icons.male,size: 50,),
                        SizedBox(height: 5,),
                        Text("Male",style: TextStyle(color: text,fontSize: 16),)
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    genderselect = 1;
                  });
                },
              ),
              SizedBox(width: 30,),
              genderselect == 2? InkWell(
                child: Container(
                  height: 100,
                  width: 100,
                  color: color1,
                  child: Card(
                    elevation: 5,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Icon(Icons.female,size: 50,),
                        SizedBox(height: 5,),
                        Text("Female",style: TextStyle(color: text,fontSize: 16),)
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    genderselect = 2;
                  });
                },
              ):InkWell(
                child: Container(
                  height: 100,
                  width: 100,

                  child: Card(
                    elevation: 5,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Icon(Icons.female,size: 50,),
                        SizedBox(height: 5,),
                        Text("Female",style: TextStyle(color: text,fontSize: 16),)
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    genderselect = 2;
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
                    if(genderselect==1){
                      Genders="Male";
                    }else{
                      Genders="Female";
                    }
                    Navigator.pushNamed(context, 'Birthdate');
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
