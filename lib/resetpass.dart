import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class Resetpass extends StatefulWidget {
  @override
  _ResetpassState createState() => _ResetpassState();
}

class _ResetpassState extends State<Resetpass> {
  @override
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _Emailcontroller = TextEditingController();
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
              child: Text('Enter your email address to continue',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(' Email',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
            ),
            SizedBox(height: 15,),
            Form(
              key: formkey,
              child: Center(
                child: Container(
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
              ),
            ),
            SizedBox(height: 100,),
            Center(
              child: Container(
                height: 59,
                width: MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(
                ),
                child: RaisedButton(
                  color: blue,
                  child: const Text(
                    "Save & continue",
                    style: TextStyle(color: Colors.white , fontSize: 16 ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Resetpassconfirm');
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
