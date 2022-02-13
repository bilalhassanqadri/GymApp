import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../DataFile.dart';

class Birthdate extends StatefulWidget {
  @override
  _BirthdateState createState() => _BirthdateState();
}

class _BirthdateState extends State<Birthdate> {
  @override
  String _date = "Date of Birth";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Step 2 of 5',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(child: Text("When were you born?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),)),
          SizedBox(height: 30,),
          Center(child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text("We use your age to customize your exercise and nutritional settings",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: text,fontSize: 18),),
          )),
          SizedBox(height: 30,),
          Padding(padding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: blue
                        ),
                        borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(1900, 1, 1),
                          maxTime: DateTime.now().subtract(const Duration(days: 5840)), onConfirm: (date) {
                            print('Date of birth $date');
                            _date = '${date.day}/${date.month}/${date.year}';
                            setState(() {});
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(

                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.cake,

                                      color: Colors.black54,
                                    ),
                                    Text(
                                      "  $_date",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Icon(Icons.date_range,color: Colors.black45,)

                        ],
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
                // datetime()
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  child: Container(
                    height: 50 ,
                    width: 50,
                    child: Icon(Icons.arrow_forward,color: blue,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color(0xFF0798C6).withOpacity(0.4),
                    ),
                  ),
                  onTap: (){
                    if(_date=="Date of Birth"){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Please Select Date of Birth")));
                    }else{
                      Born=_date;
                      Navigator.pushNamed(context, 'Height');
                    }

                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
