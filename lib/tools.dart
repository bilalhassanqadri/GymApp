import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Tools',style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 26),),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width/2.5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Image.asset('assets/macro.png',height: 129,width: 170,),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Divider(
                          color: blue,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Macro Calculatorr',style: TextStyle(color: blue,fontSize: 13),),
                            Icon(Icons.arrow_forward_ios,color: blue,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, 'Macro');
                },
              ),
              InkWell(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width/2.5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Image.asset('assets/bmr.png',height: 129,width: 170,),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Divider(
                          color: blue,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('BMR & TDEE\nCalculator',style: TextStyle(color: blue,fontSize: 13),),
                            Icon(Icons.arrow_forward_ios,color: blue,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, 'BMR');
                },
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width/2.5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Image.asset('assets/body.png',height: 129,width: 170,),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Divider(
                            color: blue,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Body Fat\nCalculator',style: TextStyle(color: blue,fontSize: 13),),
                              Icon(Icons.arrow_forward_ios,color: blue,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'BodyFat');
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
