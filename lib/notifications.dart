import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

import 'DataFile.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Notifications',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Align(
            child: Container(
              height: 60,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SwitchListTile(
                  activeColor: blue,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text('Allow Notification' , style: TextStyle(color: Colors.black , fontSize: 15),),
                  ),
                  //  tileColor: tilecolor,
                  value: isSelected,
                  onChanged: (bool value){
                    setState(() {
                      isSelected=!isSelected;
                    });
                  },
                ),
                //contentPadding: EdgeInsets.only(left: 50 , right: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
