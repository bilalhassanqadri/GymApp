import 'dart:convert';

import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:http/http.dart' as http;

import 'DataFile.dart';
class Resetpassconfirm extends StatefulWidget {
  @override
  _ResetpassconfirmState createState() => _ResetpassconfirmState();
}

class _ResetpassconfirmState extends State<Resetpassconfirm> {

  String data1;
  Future<String> ResetPassword(String pass)async {
    print(userID);
    final response = await http.post(Uri.parse(URL+'updatepassword.php'), body: {
      "userid":userID.toString(),
      "newpass":pass.toString(),
    });
    if (response.statusCode == 200){
      data1 = json.decode(response.body);
      print("Data :: "+data1);
      if(data1=="yes") {
        print("yes");
        return "Success";
      }
      else
      {
        print("no");
        return "fail";
      }
    }
  }

  @override
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _Passcontroller = TextEditingController();
  final _Confirmpasscontroller = TextEditingController();
  bool hidepassword= true;
  bool confirmhidepassword= true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Reset Password',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Enter a new password to reset the old one!',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),),
            ),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(' Password',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                ),
                SizedBox(height: 15,),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width/1.1,
                          child: TextFormField(
                            controller: _Passcontroller,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Required";
                              }else if(value.length<8){
                                return 'Password must be at least 8 characters long';
                              }
                              else{
                                return null;
                              }
                            },
                            obscureText: hidepassword,
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
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        hidepassword=!hidepassword;
                                      });
                                    },
                                    child: Icon(Icons.visibility,color: Color(0xFF91919F),)),
                              ),
                              hintText: '*******',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Confirm Password',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Center(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width/1.1,
                          child: TextFormField(
                            controller: _Confirmpasscontroller,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Required";
                              }else if(value.length<8){
                                return 'Password must be at least 8 characters long';
                              }
                              else{
                                return null;
                              }
                            },
                            obscureText: confirmhidepassword,
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
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        confirmhidepassword=!confirmhidepassword;
                                      });
                                    },
                                    child: Icon(Icons.visibility,color: Color(0xFF91919F),)),
                              ),
                              hintText: '*******',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 100,),
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
                      "Reset Password",
                      style: TextStyle(color: Colors.white , fontSize: 16 ),
                    ),
                    progressWidget: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                    onPressed: () async{
                      // Navigator.pushNamed(context, 'Signin');
                      if (formkey.currentState.validate()){
                        if(_Confirmpasscontroller.text==_Passcontroller.text){
                          String answer=await ResetPassword(_Passcontroller.text.toString());
                          if(answer=="Success"){
                            _Confirmpasscontroller.text="";
                            _Passcontroller.text="";
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Your Password has been changed!')));
                          }else{
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Issue in server')));
                          }
                        }else{
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Passwords should be same')));
                        }

                      }

                    },
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
                    "Cancel",
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
    );
  }
}
