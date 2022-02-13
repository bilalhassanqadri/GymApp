import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

import 'DataFile.dart';

class GeneralHealth extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<GeneralHealth> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _f9 = TextEditingController()..text=f9;
  final _f10 = TextEditingController()..text=f10;
  final _f11 = TextEditingController()..text=f11;
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
              Text('General Health',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),),
              SizedBox(height: 30,),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Have you premitted to exercise by a doctor?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                          controller: _f9,
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
                        Text('What is your medical history?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f10,
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
                        Text('Are you taking any medications?\nif yes, do you have any side effects?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f11,
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
                        f9=_f9.text;
                        f10=_f10.text;
                        f11=_f11.text;
                        Navigator.pushNamed(context, 'TrainingQuestions');
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
