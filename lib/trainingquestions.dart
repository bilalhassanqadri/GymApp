import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

import 'DataFile.dart';

class TrainingQuestions extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<TrainingQuestions> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _f12 = TextEditingController()..text=f12;
  final _f13 = TextEditingController()..text=f13;
  final _f14 = TextEditingController()..text=f14;
  final _f15 = TextEditingController()..text=f15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Goals & Preferences',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text('Training',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),),
              SizedBox(height: 30,),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What type of exercise do you like?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                    SizedBox(height: 10,),
                    Container(
                      height: 65,
                      constraints: BoxConstraints(maxHeight: 100),
                      width: MediaQuery.of(context).size.width/1.1,
                      child: SingleChildScrollView(
                        child: TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Required";
                            }
                          },
                          controller: _f12,
                          decoration: InputDecoration(
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: border, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ) ,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: border
                                )
                            ),
                            hintText: 'type here....',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('What was your most recent action programs?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          height: 65,
                          constraints: BoxConstraints(maxHeight: 100),
                          width: MediaQuery.of(context).size.width/1.1,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: _f13,
                              decoration: InputDecoration(
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: border, width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ) ,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: border
                                    )
                                ),
                                hintText: 'type here....',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Have you worked with a trainer before?\nAnd If yes, what are the results?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          height: 65,
                          constraints: BoxConstraints(maxHeight: 100),
                          width: MediaQuery.of(context).size.width/1.1,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: _f14,
                              decoration: InputDecoration(
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: border, width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ) ,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: border
                                    )
                                ),
                                hintText: 'type here....',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Do you have any existing or previous injuries?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          height: 65,
                          constraints: BoxConstraints(maxHeight: 100),
                          width: MediaQuery.of(context).size.width/1.1,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: _f15,
                              decoration: InputDecoration(
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: border, width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ) ,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: border
                                    )
                                ),
                                hintText: 'type here....',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80,),
                  ],
                ),
              ),

              Center(
                child: Container(
                  height: 59,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                  ),
                  child: RaisedButton(
                    color: blue,
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white , fontSize: 16 ),
                    ),
                    onPressed: () {
                      if (formkey.currentState.validate()){
                        f12=_f12.text;
                        f13=_f13.text;
                        f14=_f14.text;
                        f15=_f15.text;
                        Navigator.pushNamed(context, 'LifeStyle');
                      }

                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 59,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                  ),
                  child: RaisedButton(
                    color: Colors.white,
                    child: const Text(
                      "Back",
                      style: TextStyle(color: blue , fontSize: 16 ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
