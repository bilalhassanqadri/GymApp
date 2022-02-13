import 'package:fitnessapp/DataFile.dart';
import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _f1 = TextEditingController()..text=f1;
  final _f2 = TextEditingController()..text=f2;
  final _f3 = TextEditingController()..text=f3;


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
              Text('Goals',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),),
              SizedBox(height: 30,),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Why are you training?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          height: 65,
                          constraints: BoxConstraints(maxHeight: 100),
                          width: MediaQuery.of(context).size.width/1.1,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              controller: _f1,

                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
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
                        Text('What is your short term (1st year) fitness goal?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          height: 65,
                          constraints: BoxConstraints(maxHeight: 100),
                          width: MediaQuery.of(context).size.width/1.1,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              controller: _f2,

                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
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
                        Text('What is your long term (1st year) fitness goal?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          height: 65,
                          constraints: BoxConstraints(maxHeight: 100),
                          width: MediaQuery.of(context).size.width/1.1,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              controller: _f3,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },

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

                  ],
                ),
              ),

              SizedBox(height: 80,),
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
                        f1=_f1.text;
                        f2=_f2.text;
                        f3=_f3.text;
                        Navigator.pushNamed(context, 'Diet');
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
