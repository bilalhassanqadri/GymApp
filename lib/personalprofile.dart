import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'DataFile.dart';

class Personalprofile extends StatefulWidget {
  @override
  _PersonalprofileState createState() => _PersonalprofileState();
}

class _PersonalprofileState extends State<Personalprofile> {
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
  @override
  void initState() {
  //  DateTime tempDate = new DateFormat().parse(Born);

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Personal Profile',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: red,
                      image: DecorationImage(
                          image: AssetImage(Genders=='Female'?'assets/female.png':'assets/avatar.png'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Name,textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.email,color: white,size: 12,),
                        SizedBox(width: 3,),
                        Text(Emails,textAlign: TextAlign.center ,style: TextStyle(color: border,fontSize: 12),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: blue,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                Text(Name,textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14),),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: blue,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gender",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                Text(Genders,textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14),),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: blue,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Age",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                Text(calculateAge(DateFormat("dd/MM/yyyy").parse(Born)).toString(),textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14),),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: blue,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Height",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                Text(Tall+" "+TallUnit,textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14),),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: blue,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Weight",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                Text(Weights+" "+WeightUnit,textAlign: TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 14),),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: blue,
            ),
          ),
          SizedBox(height: 50,),
         Center(
            child: Container(
              height: 59,
              width: MediaQuery.of(context).size.width/1.1,
              decoration: BoxDecoration(
              ),
              child: RaisedButton(
                color: blue,
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.white , fontSize: 16 ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'EditProfile').then((_) => setState(() {}));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
