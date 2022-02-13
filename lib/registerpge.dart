import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DataFile.dart';
final FirebaseAuth mAuth = FirebaseAuth.instance;
class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  Map<String, dynamic> _userData;
bool checkedValue=false;
  String welcome = "Facebook";
  @override
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _Emailcontroller = TextEditingController();
  final _Passcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _Confirmpasscontroller = TextEditingController();
  bool hidepassword= true;
  bool confirmhidepassword= true;
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
  String data1;
  Future<String> Signups()async {
    final response = await http.post(Uri.parse(URL+'usersignup.php'), body: {
      "name":_namecontroller.text.toString(),
      "email":_Emailcontroller.text.toString(),
      "password":_Passcontroller.text.toString(),
      "signintype":'Email',
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

  String data;
  Future<String> checkuser(String email) async {
    final response = await http.post(Uri.parse(URL+'userexisit.php'), body: {
      "email":email.toString(),
    });
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print("Data :: "+data);
      if(data=="yes") {
        print("yes");
        return "Success";
      }
      else
      {
        print("no");
        return "fail";
      }
    }
    else{
      throw Exception('Failed to load album');
    }
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 34),),
                    SizedBox(height: 10,),
                    Text('Please register yourself for an account to continue',style: TextStyle(color: Colors.black,fontSize: 14),),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' Name',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                          const SizedBox(height: 15,),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width/1.1,
                            child: TextFormField(
                              controller: _namecontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }else if(value.length<3){
                                  return 'First Name must be at least 3 characters';
                                }
                                else{
                                  return null;
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
                                      color:border,
                                    )
                                ),

                                hintText: 'Name',
                              ),


                            ),
                          ),
                          const SizedBox(height: 15,),
                          Text(' Email',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                          SizedBox(height: 15,),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width/1.1,
                            child: TextFormField(
                              controller: _Emailcontroller,
                              validator: MultiValidator(
                                  [
                                    RequiredValidator(errorText: 'Required'),
                                    EmailValidator(errorText: "Not a Valid Email"),
                                  ]
                              ),

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
                                hintText: 'myemail@example.com',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(' Password',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                        ),
                        SizedBox(height: 15,),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Confirm Password',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
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
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: Align(
                  child: ButtonBar(
                    mainAxisSize: MainAxisSize.min,

                    children: <Widget>[
                      ProgressButton(
                        height: 59,
                        borderRadius: 8,
                        width: MediaQuery.of(context).size.width / 1.1,
                        color: blue,
                        defaultWidget: const Text(
                          "Register",
                          style: TextStyle(color: Colors.white , fontSize: 16 ),
                        ),
                        progressWidget: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                        onPressed: () async{
                          // Navigator.pushNamed(context, 'Signin');
                          if (formkey.currentState.validate()){
                            if(_Confirmpasscontroller.text==_Passcontroller.text){
                              if(checkedValue==true){
                                String answer = await checkuser(_Emailcontroller.text);
                                if (answer != "Success"){
                                  String isSignup=await Signups();
                                  if(isSignup=='Success'){
                                    ExtraEmailforLogin=_Emailcontroller.text;
                                    EXtraPasswordForLogin=_Passcontroller.text;
                                    _namecontroller.text="";
                                    _Emailcontroller.text="";
                                    _Passcontroller.text="";
                                    _Confirmpasscontroller.text="";
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text('Successfully Signed Up!')));
                                    Navigator.pushNamed(context,'Signin');
                                  }
                                }else{
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text('This Email is Already Registered')));
                                }
                              }else{
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text('Accept the Terms and Conditions')));
                              }


                            }else{
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Password and Confirm Password does not match')));
                            }

                          }
                        },
                       /* shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),*/
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              CheckboxListTile(
                title: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text:  "By tapping the above “Register” button. I agree to the ",style: TextStyle(color: Colors.black,fontSize: 14)),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: TextStyle(decoration: TextDecoration.underline,color: blue,fontSize: 14),
                        recognizer: new TapGestureRecognizer()..onTap = (){
                          print('privacy');
                          _launchURL('https://www.google.com/');
                        },
                      ),
                      TextSpan(
                        text: ' and to the',
                        style: TextStyle(color: Colors.black,fontSize: 14),
                      ),
                      TextSpan(
                        text: ' Terms and Conditions',
                        style: TextStyle(decoration: TextDecoration.underline,color: blue,fontSize: 14),
                        recognizer: new TapGestureRecognizer()..onTap = (){
                          print('privacy');
                          _launchURL('https://www.google.com/');
                        },
                      ),
                      TextSpan(
                        text: ' of the platform',
                        style: TextStyle(color: Colors.black,fontSize: 14),
                      ),
                    ],
                  ),
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),

              SizedBox(height: 30,),
              Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 10),
                          child: Divider(
                            color: Colors.black,
                          ),
                        )
                    ),

                    Text("Or continue with",style: TextStyle(color: border),),

                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20,left: 10),
                          child: Divider(
                            color: Colors.black,
                          ),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      signInusingGoogle();
                      print("google ");
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width/2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(' Google',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                          Image.asset('assets/Google.png'),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      signInWithFacebook();
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width/2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(' Facebook',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                          Image.asset('assets/facebook.png'),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Center(
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
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  void MyDailog(BuildContext context,String Title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title: new Text(Title),
              content: new Text(
                  message),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text("OK"),
                  onPressed: () =>
                      Navigator.pop(
                          context),
                )
              ],
            )
    );
  }


  // Facebook





  // Google
  final GoogleSignIn googleSignIn=new GoogleSignIn();
  String data2;
  Future<String> Signup(String email,String name,int x)async {
    final response = await http.post(Uri.parse(URL+'usersignup.php'), body: {
      "name":name,
      "email":email,
      "password": "nahegoa897748",
      "signintype":x==1?'Gmail':'Facebook',
    });
    if (response.statusCode == 200){
      data2= json.decode(response.body);
      print("Data :: "+data2);
      if(data2=="yes") {
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


  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Please Wait..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  List datas;
  Future<String> LoginUser(String emails,String password,int flag) async {
    final response = await http.post(Uri.parse(URL+'login.php'), body: {
      "email":emails.toString(),
      "password":password.toString(),
      "type":flag==1?"Email":flag==2?"Gmail":"Facebook",
    });
    //  print("asd");
    if (response.statusCode == 200) {
      datas = json.decode(response.body);


      print("receive :: "+datas.toString());
      if(datas==null){
        print("f");
        return "fail";
      }
      else if(datas.length>0) {
        print("Data :: "+datas.toString());
        print(datas[0]['id']);
        userID=datas[0]['id'].toString();
        Name=datas[0]['name'].toString();
        Emails=datas[0]['email'].toString();
        SigninType=datas[0]['signintype'].toString();
        /*SharedPreferences preferences=await SharedPreferences.getInstance();
        preferences.setString('email', emails);*/
        Goalls=datas[0]['goal'].toString();
        Genders=datas[0]['gender'].toString();
        Born=datas[0]['dob'].toString();
        Tall=datas[0]['tall'].toString();
        TallUnit=datas[0]['tallunit'].toString();
        Weights=datas[0]['weight'].toString();
        WeightUnit=datas[0]['weightunit'].toString();
        if(Goalls==null || Goalls=='')
          WeightUnit=datas[0]['oftenexercise'].toString();
        else
          ExDays=double.parse(datas[0]['oftenexercise']);
        print("s");
        return "Success";
      }
      else
      {
        print("f");
        return "fail";
      }
    }
    else{
      throw Exception('Failed to load album');
    }
  }


  void signInusingGoogle()async{


    showLoaderDialog(context);

    final GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    final UserCredential authResult = await mAuth.signInWithCredential(credential);
    final User user = authResult.user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await mAuth.currentUser;
    assert(user.uid == currentUser.uid);
    SigninType="Google";
    print("signin as google");
    print(currentUser.email);
    print(currentUser.displayName);

    String answer = await checkuser(currentUser.email);
    if (answer != "Success"){
      String isSignup=await Signup(currentUser.email,currentUser.displayName,1);
      if(isSignup=='Success'){
        String answer=await LoginUser(currentUser.email,"nahegoa897748",2);
        if(answer=="Success"){
          // Password = passwordController.text;
          if(Goalls==null || Goalls==''){
            Navigator.pop(context);
            Navigator.pushNamed(context, 'Goal');
          }else{
            Navigator.pop(context);
            Navigator.pushNamed(context, 'Homescreen');
          }

        }

      }
    }else{
      String answer=await LoginUser(currentUser.email,"nahegoa897748",2);
      if(answer=="Success"){
        // Password = passwordController.text;
        if(Goalls==null || Goalls==''){
          Navigator.pop(context);
          Navigator.pushNamed(context, 'Goal');
        }else{
          Navigator.pop(context);
          Navigator.pushNamed(context, 'Homescreen');
        }

      }else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('This Email is not Linked with this Method')));
        Navigator.pop(context);
      }
    }

  }

  Future<UserCredential> signInWithFacebook() async {
    print('facebook');
    showLoaderDialog(context);
    final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);


    if (result.status == LoginStatus.success) {

      final userData = await FacebookAuth.instance.getUserData();

      _userData = userData;
      String answer = await checkuser(_userData['email']);
      if (answer != "Success"){
        String isSignup=await Signup(_userData['email'],_userData['name'],2);
        if(isSignup=='Success'){
          String answer=await LoginUser(_userData['email'],"nahegoa897748",3);
          if(answer=="Success"){
            // Password = passwordController.text;
            if(Goalls==null || Goalls==''){
              Navigator.pop(context);
              Navigator.pushNamed(context, 'Goal');
            }else{
              Navigator.pop(context);
              Navigator.pushNamed(context, 'Homescreen');
            }

          }

        }
      }else{
        String answer=await LoginUser(_userData['email'],"nahegoa897748",3);
        if(answer=="Success"){

          // Password = passwordController.text;
          if(Goalls==null || Goalls==''){
            print("asdasd");
            Navigator.pop(context);
            Navigator.pushNamed(context, 'Goal');
          }else{
            print("asdasd1");
            Navigator.pop(context);
            Navigator.pushNamed(context, 'Homescreen');
          }

        }else{
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('This Email is not Linked with this Method')));
          Navigator.pop(context);
        }
      }
    } else {
      print(result.message);
    }

    setState(() {
      welcome = _userData['email'];
      print(welcome);
    //  Navigator.pop(context);
    });


    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
