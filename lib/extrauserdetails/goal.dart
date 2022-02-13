import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import '../extrauserdetails/../DataFile.dart';
class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(child: Text("What's your goal?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),)),
            SizedBox(height: 30,),
            InkWell(
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width/1.1,
                child: Card(
                  elevation: 5,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Lose weight",style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 17),),
                            SizedBox(height: 5,),
                            Text("Burn fat & get lean",style: TextStyle(color: text,fontSize: 13),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_forward_ios,color: text,),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: (){
                Goalls="Lose Weight";
                Navigator.pushNamed(context, 'Gender');
              },
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Goalls="Get fitter";
                Navigator.pushNamed(context, 'Gender');
              },
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width/1.1,
                child: Card(
                  elevation: 5,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Get fitter",style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 17),),
                            SizedBox(height: 5,),
                            Text("Tone up & feel healthy",style: TextStyle(color: text,fontSize: 13),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_forward_ios,color: text,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Goalls="Gain weight";
                Navigator.pushNamed(context, 'Gender');
              },
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width/1.1,
                child: Card(
                  elevation: 5,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text("Gain weight",style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 17),),
                            SizedBox(height: 5,),
                            Text("Build mass & strenght",style: TextStyle(color: text,fontSize: 13),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_forward_ios,color: text,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,),
          /*  Center(
              child: InkWell(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text:  "Already have an Account? ",style: TextStyle(color: Colors.black,fontSize: 14)),
                      TextSpan(
                        text: 'Login!',
                        style: TextStyle(decoration: TextDecoration.underline,color: blue,fontSize: 14),
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, 'Signin');
                },
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
