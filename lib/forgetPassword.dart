import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import '../DataFile.dart';
import '../color.dart';

class Forgotpass extends StatefulWidget {
  @override
  _ForgotpassState createState() => _ForgotpassState();
}

bool _signinbutton=false;
String data;
Future<String> checkEmail(String email) async {
  final response = await http.post(Uri.parse(URL+'userexisit.php'), body: {
    "email":email.toString(),
  });
  if (response.statusCode == 200) {
    data = json.decode(response.body);
    print("Data :: "+data);
    if(data=="yes") {
      return "Success";
    }
    else
    {
      return "fail";
    }
  }
  else{
    throw Exception('Failed to load album');
  }
}

Future<String> sentmail(String emails)  async {


  final response = await http.post(Uri.parse('https://syskosoft.com/fitness/serverfiles/mail.php'), body: {
    "email":emails.toString(),
  });
  if (response.statusCode == 200) {
    return "success";
  }
  else{
    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}

class _ForgotpassState extends State<Forgotpass> {
  GlobalKey<FormState> _formKey1=GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signinbutton=false;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blue,
        elevation: 0,

        title: Center(child: Text('Reset Password' , style: TextStyle(fontSize: 31 ),)),
        //  automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline_rounded,size: 150,color: Colors.blue,),
              SizedBox(height: 5,),
              Text('Reset Password', style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold,color: Colors.grey),),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: TextFormField(
                      controller: emailController,
                      validator: MultiValidator(
                          [
                            RequiredValidator(errorText: 'Required'),
                            EmailValidator(errorText: "Not a Valid Email"),
                          ]
                      ),
                      decoration: InputDecoration(
                          enabled: true,
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color:Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width:1, color: Colors.greenAccent),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          hintText: 'Email'
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: !_signinbutton? RaisedButton(
                    color: blue,
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white , fontSize: 20 ),
                    ),
                    onPressed: () async{
                      if (_formKey1.currentState.validate()){
                        setState(() {
                          _signinbutton=true;
                        });
                        String answer=await checkEmail(emailController.text);
                        setState(() {
                          _signinbutton=false;
                        });
                        if(answer=="Success"){
                          print("in success");
                          setState(() {
                            _signinbutton=true;
                          });
                          String answer=await sentmail(emailController.text);
                          emailController.text="";
                          Navigator.pop(context);
                          print("valid");
                          setState(() {
                            _signinbutton=false;
                          });

                        }else{
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Given! Email is not registered!')));
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ):Center(child: CircularProgressIndicator(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
