import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/DataFile.dart';
import 'package:fitnessapp/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'Modles/Trainers.dart';
import 'Modles/TrainersType.dart';

class Trainerprofile extends StatefulWidget {
  Trainers obj;
  Trainerprofile(Trainers id){
    this.obj=id;
  }
  @override
  _TrainerprofileState createState() => _TrainerprofileState();
}

class _TrainerprofileState extends State<Trainerprofile> {
  Map<String, dynamic> paymentIntentData;

  Future<void> _launched;

  Future<void> _openUrl() async {
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['example@example.com'],
      cc: ['cc@example.com'],
      bcc: ['bcc@example.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [


                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width/1,
                    child: CachedNetworkImage(
                      imageUrl: widget.obj.back_image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,),
                        ),
                      ),
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    iconSize: 25,
                    color: Colors.white,
                    splashColor: Colors.purple,
                    onPressed: () {
                      print(f1);
                      print(f20);
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120,left: 20),
                    child: Container(
                      width: 104,
                      height: 104,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.obj.image),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      print('email sent');
                      setState(() {
                        _launched = _openUrl();
                        });

                    },
                    child: Container(
                      height: 39,
                      width: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: blue)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Contact Trainer',
                              style: TextStyle(color: blue , fontSize: 14,fontWeight: FontWeight.w300),
                            ),
                            Icon(Icons.email,color: blue,),
                            //Image.asset('assets/phoneicon.png',color: blue,),
  ]),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,
                  ),
                  Container(
                    height: 39,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: RaisedButton(
                      color: blue,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Hire Trainer',
                              style: TextStyle(color: Colors.white , fontSize: 14,fontWeight: FontWeight.w300),
                            ),
                            Icon(Icons.work_outline,color: Colors.white,)
                          ],
                        ),
                      ),
                      onPressed: () async{
                        if(f1!=null || f1==""){
                          await makePayment();
                       //   if(paymentIntentData!)
                        }else
                          {
                            whichbutton=2;
                            Navigator.pushNamed(context, 'Goals');
                          }

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  color: blue,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Experience :', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Qualification :', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Transformation :', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Interests :', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),),
                      ),

                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Training at :', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Follow him :', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.obj.experience.toString()+' Years', style: TextStyle(fontSize: 14),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.obj.Qualification, style: TextStyle(fontSize: 15),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.obj.available_slos.toString(), style: TextStyle(fontSize: 15),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.obj.Intrests, style: TextStyle(fontSize: 15),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.obj.training_at, style: TextStyle(fontSize: 15),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Instagram', style: TextStyle(fontSize: 15,decoration: TextDecoration.underline, color: Colors.blue),),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  color: blue,
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('About Trainer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  ],
                ),

              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right:
                20),
                child: Text(widget.obj.about_trainer),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ],
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
        showLoaderDialog1(context);
        String isSignup=await placeorder();
        if(isSignup=='Success'){
          Navigator.pop(context);
          Navigator.pushNamed(context, 'Homescreen');
        }
      }).onError((error, stackTrace){
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled "),
          ));
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



