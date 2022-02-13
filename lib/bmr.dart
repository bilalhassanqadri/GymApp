import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';

class BMR extends StatefulWidget {
  @override
  _MacroState createState() => _MacroState();
}

class _MacroState extends State<BMR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('BMR & TDEE Calculator',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Age',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
          ),
          SizedBox(height: 10,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.1,
              decoration: BoxDecoration(
                border: Border.all(color: border,width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    hint: Text('Select Any'),
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(

                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                    },
                  )

              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Choose From',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Row(
              children: [
                Container(
                  height: 29,
                  child:Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text('Male',style: TextStyle(color: blue,fontSize: 14),),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFF0798C6).withOpacity(0.24),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: 29,
                  child:Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text('Female',style: TextStyle(color: Colors.black,fontSize: 14),),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: border.withOpacity(0.24),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Height',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      border: Border.all(color: border,width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          hint: Text('Select Any'),
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                          },
                        )

                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Units',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      border: Border.all(color: border,width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          hint: Text('Ibs'),
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                          },
                        )

                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weight',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      border: Border.all(color: border,width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          hint: Text('Select Any'),
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                          },
                        )

                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Units',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      border: Border.all(color: border,width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          hint: Text('meter'),
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 36,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                          },
                        )

                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 60,),
          Center(
            child: Container(
              height: 59,
              width: MediaQuery.of(context).size.width/1.1,
              decoration: BoxDecoration(
              ),
              child: RaisedButton(
                color: blue,
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white , fontSize: 16 ),
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, 'Resetpassconfirm');
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
