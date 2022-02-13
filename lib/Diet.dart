import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

import 'DataFile.dart';

class Diet extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Diet> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _f4 = TextEditingController()..text=f4;
  final _f5 = TextEditingController()..text=f5;
  final _f6 = TextEditingController()..text=f6;
  final _f7 = TextEditingController()..text=f7;
  final _f8 = TextEditingController()..text=f8;

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
              Text('Diet',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),),
              SizedBox(height: 30,),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What does your diet looks like?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                          controller: _f4,
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
                        Text('How many meals do you take in a day?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f5,

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
                        Text('Do you have any food allergies?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f6,

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
                        Text('Do you take supplements?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f7,

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
                        Text('How many calories you take in a day?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f8,

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
                    SizedBox(height: 60,),
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
                              f4=_f4.text;
                              f5=_f5.text;
                              f6=_f6.text;
                              f7=_f7.text;
                              f8=_f8.text;
                              Navigator.pushNamed(context, 'GeneralHealth');
                            }

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ],
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
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
