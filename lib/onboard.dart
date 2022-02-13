import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

class Onbaord extends StatefulWidget {
  @override
  _OnbaordState createState() => _OnbaordState();
}

class _OnbaordState extends State<Onbaord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/Group.png',height: 300,width: 300,)),
          SizedBox(height: 30,),
          Text('Fitness Gurus',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 34),),
          SizedBox(height: 10,),
          Text('Find best fitness gurus for your workout training\n today.',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 14),),
          SizedBox(height: 40,),
          Container(
            height: 59,
            width: MediaQuery.of(context).size.width/1.3,
            decoration: BoxDecoration(
            ),
            child: RaisedButton(
              color: blue,
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white , fontSize: 16 ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'Signin');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
