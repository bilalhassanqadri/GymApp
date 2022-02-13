import 'dart:convert';

import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'DataFile.dart';

class LifeStyle extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<LifeStyle> {
  Map<String, dynamic> paymentIntentData;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _f16 = TextEditingController()..text=f16;
  final _f17 = TextEditingController()..text=f17;
  final _f18 = TextEditingController()..text=f18;
  final _f19 = TextEditingController()..text=f19;
  final _f20 = TextEditingController()..text=f20;
  Future<String> Goal()async{
    alreadySaveData=1;
    print(userID);
    print("yes");
    final response = await http.post(Uri.parse(URL+'addgoals.php'), body: {
      "whytraining" :f1,
      "shorttermfitnessgoal" : f2,
      'Longtermfitnessgoal' : f3,
      'Diet' : f4,
      'Mealsaday' : f5,
      'Foodallergies' : f6,
      'Seuplements' : f7,
      'Calories' : f8,
      "DoctorPermission" : f9,
      "Medicalhistory" : f10,
      'sideeffects' : f11,
      "Typeofexercise" :f12,
      "RecentAction" : f13,
      'Workedwithtrainer' : f14,
      "Previousinjuries" : f15,
      'Living' : f16,
      "Sleepinaday" : f17,
      'Drinkoften' : f18,
      "Smokeoften" :f19,
      'Discount' : f20,


      "userid":userID.toString(),
    });
    //  print("asd");
    String data;
    print (response.statusCode);
    if (response.statusCode == 200) {
      alreadySaveData=1;
      //  data = json.decode(response.body);
      return "ok";
    }
    else{
      throw Exception('Failed to load album');
    }
  }
  Future<String> UpdateGoal()async{
    print('dd');
    alreadySaveData=1;
    print(userID);
    print(f1);
    print(f1);
    print("yes");
    final response = await http.post(Uri.parse(URL+'updategoal.php'), body: {
      "whytraining" :f1,
      "shorttermfitnessgoal" : f2,
      'Longtermfitnessgoal' : f3,
      'Diet' : f4,
      'Mealsaday' : f5,
      'Foodallergies' : f6,
      'Seuplements' : f7,
      'Calories' : f8,
      "DoctorPermission" : f9,
      "Medicalhistory" : f10,
      'sideeffects' : f11,
      "Typeofexercise" :f12,
      "RecentAction" : f13,
      'Workedwithtrainer' : f14,
      "Previousinjuries" : f15,
      'Living' : f16,
      "Sleepinaday" : f17,
      'Drinkoften' : f18,
      "Smokeoften" :f19,
      'Discount' : f20,


      "userid":userID.toString(),
    });
    //  print("asd");
    String data;
    print (response.statusCode);
    if (response.statusCode == 200) {
      //  data = json.decode(response.body);
      return "ok";
    }
    else{
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
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
              Text('Life Style',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),),
              SizedBox(height: 30,),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What do you do for a living?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                          controller: _f16,
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
                        Text('How many hours of sleep you get in a day?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f17,
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
                        Text('Do you drink? If yes, how often then?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f18,
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
                        Text('Do you smoke? If yes, how often then?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f19,
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
                        Text('Do you have any friends/family members you\nwant to invite for 10% discount?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
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
                              controller: _f20,
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

              SizedBox(height: 60,),
              Center(
                child:   ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProgressButton(
                      height: 59,
                      borderRadius: 8,
                      width: MediaQuery.of(context).size.width / 1.1,
                      color: blue,
                      defaultWidget:  Text(
                        mycase==2?"Save": "Save & Pay",
                        style: TextStyle(color: Colors.white , fontSize: 16 ),
                      ),
                      progressWidget: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                      onPressed: () async{
                        if (formkey.currentState.validate()){
                          if(mycase==1){
                            if(alreadySaveData==0){
                              f16=_f16.text;
                              f17=_f17.text;
                              f18=_f18.text;
                              f19=_f19.text;
                              f20=_f20.text;

                              String answer  = await Goal();
                              if( answer == "ok"){
                                await makePayment();
                              }
                            }else{
                              await makePayment();
                            }
                          }else if(mycase==2){
                            if(alreadySaveData==0){
                              print('1');
                              f16=_f16.text;
                              f17=_f17.text;
                              f18=_f18.text;
                              f19=_f19.text;
                              f20=_f20.text;

                              String answer  = await Goal();
                              if( answer == "ok"){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data has been Updated successfully" )));
                                Navigator.pushNamed(context, 'Homescreen');
                              }
                            }else{
                              print('2');
                              f16=_f16.text;
                              f17=_f17.text;
                              f18=_f18.text;
                              f19=_f19.text;
                              f20=_f20.text;
                              String answer  = await UpdateGoal();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data has been Updated successfully" )));
                              Navigator.pushNamed(context, 'Homescreen');
                            }


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
                      "Home",
                      style: TextStyle(color: blue , fontSize: 16 ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'Homescreen');
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
  showLoaderDialog1(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Placing Order Please Wait..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


  String data1;
  Future<String> placeorder()async {
    alreadySaveData=2;
    final response = await http.post(Uri.parse(URL+'placeorder.php'), body: {
      "UserID":userID.toString(),
      "trainerID":trainerID.toString(),
      "Status":"1",
      "TotalAmount":'20',
    });
    if (response.statusCode == 200){
      data1 = json.decode(response.body);
      print("Data :: "+data1);
      if(data1=="yes") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your Order has been placed" )));
        return "Success";
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("if your amount is deducted please contact support" )));
        return "fail";
      }
    }
  }



  Future<void> makePayment() async {
    try {
      showLoaderDialog(context);
      paymentIntentData =
      await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData['client_secret'],
              applePay: true,
              googlePay: true,
              testEnv: true,
              style: ThemeMode.dark,
              merchantCountryCode: 'US',
              merchantDisplayName: 'Gym Application')).then((value){
      });

      Navigator.pop(context);
      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }


  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
            clientSecret: paymentIntentData['client_secret'],
            confirmPayment: true,
          )).then((newValue)async{


        print('payment intent'+paymentIntentData['id'].toString());
        print('payment intent'+paymentIntentData['client_secret'].toString());
        print('payment intent'+paymentIntentData['amount'].toString());
        print('payment intent'+paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Paid Successfully")));
        paymentIntentData = null;
        showLoaderDialog1(context);
        String isSignup=await placeorder();

        if(isSignup=='Success'){
          Navigator.pop(context);
          Navigator.pushNamed(context, 'Homescreen');
        }


      }).onError((error, stackTrace){
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
       // Navigator.pushNamed(context, 'Homescreen');
      });


    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled "),
          ));
     // Navigator.pushNamed(context, 'Homescreen');
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer sk_test_51J1dT8CuOSsU8OIyxBXptuQYMgotOTGQB7uqdmfx7WBZ0ZGYOHl1MiDEO4gENzhwmpTHxjGqvaGaPhr9hlAn0Lqa00dOLIRk5y',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100 ;
    return a.toString();
  }



}
