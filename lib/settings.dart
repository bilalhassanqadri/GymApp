import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DataFile.dart';
class Setings extends StatefulWidget {
  @override
  _SetingsState createState() => _SetingsState();
}

class _SetingsState extends State<Setings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(SigninType);
  }
  @override
  bool isSelected = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 26),),
          ),
          SizedBox(height: 60,),
          Expanded(child: ListView(
            children: [
              SizedBox(height: 15,),
              Align(
                child: InkWell(
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(5, 0),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/profile.png'),
                          SizedBox(width: 30,),
                          Text('Personal Details' , style: TextStyle(color: border , fontSize: 15),),
                          SizedBox(width: MediaQuery.of(context).size.width/3,),
                          Icon(Icons.arrow_forward_ios_outlined , color: Colors.black,),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){

                  Navigator.pushNamed(context, 'Personalprofile');
                  },
                ),
              ),
              SizedBox(height: 15,),
             Align(
                child:InkWell(
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(5, 0),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/goals.png'),
                          SizedBox(width: 30,),
                          Text('Goals & Prefrences' , style: TextStyle(color: border , fontSize: 15),),
                          SizedBox(width: MediaQuery.of(context).size.width/3.4,),
                          Icon(Icons.arrow_forward_ios_outlined , color: Colors.black,),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    /*if(f20=="" || f20==null){
                      whichbutton=1;*/
                    UpdateGoal=1;
                    mycase=2;
                    print(f20);
                      Navigator.pushNamed(context, 'Goals');
                   /* }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data is Already Available")));
                    }*/

                  },
                ),
              ),

              SizedBox(height: 15,),
              SigninType=="Email"? Align(
                child: InkWell(
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(5, 0),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/reset.png'),
                          SizedBox(width: 30,),
                          Text('Reset Password' , style: TextStyle(color: border , fontSize: 15),),
                          SizedBox(width: MediaQuery.of(context).size.width/3,),
                          Icon(Icons.arrow_forward_ios_outlined , color: Colors.black,),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'Resetpassconfirm');
                  },
                ),
              ):Container(),
              SigninType=="Email"? SizedBox(height: 15,):Container(),
              Align(
                child: InkWell(
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(5, 0),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/noti.png'),
                          SizedBox(width: 30,),
                          Text('Notifications' , style: TextStyle(color: border , fontSize: 15),),
                          SizedBox(width: MediaQuery.of(context).size.width/2.5,),
                          Icon(Icons.arrow_forward_ios_outlined , color: Colors.black,),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'Notifications');
                  },
                ),
              ),
              SizedBox(height: 120,),
              Center(
                child: Container(
                  height: 59,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                  ),
                  child: RaisedButton(
                    color: blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log Out",
                          style: TextStyle(color: Colors.white , fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20,),
                        Icon(Icons.logout,color: Colors.white,)
                      ],
                    ),
                    onPressed: () async{
                      if(SigninType=="Google"){
                        await FirebaseAuth.instance.signOut();
                      }
                      else{
                        SharedPreferences preferences =  await SharedPreferences.getInstance();
                        await preferences.remove('email');
                        Navigator.pushNamed(context, 'Signin');
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

        ],
      ),
    );
  }
}
