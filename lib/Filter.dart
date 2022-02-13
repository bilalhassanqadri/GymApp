import 'package:fitnessapp/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'DataFile.dart';
import 'Modles/Trainers.dart';
import 'Modles/TrainersType.dart';
import 'homescreen.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  String valuechose='Item1';
  String _selected;
  String _select_gender;
  int _option=-1;
  int flagcheck=-1;
  void initState(){
    extra=[];
  }


  Widget build(BuildContext context) {
   /* print("_option :: "+_option.toString());*/
    print("first_type :: "+first_type.toString());
    List<String> listItem = [];
    for(int i=0;i<trainertype.length;i++){
      listItem.add(trainertype[i].type);
      if(i==trainertype.length)
        setState(() {

        });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Filters',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
        onTap: (){
          Navigator.pop(context);
        },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Choose Type',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
            ),
            SizedBox(height: 20,),
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
                    items: listItem.map((String value) {
                      return DropdownMenuItem<String>(

                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                      //listItem.Where((book) => book.id == id);
                      int index=listItem.indexOf(value);
                      print(trainertype[index].type);
                      print(index);
                      setState(() {
                        _selected=value;
                        first_type=trainertype[index].id;
                      });


                    },
                    value: _selected,
                  )

                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Choose From',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _option==1?  Container(
                  height: 29,
                  child:Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text('Standard',style: TextStyle(color: Colors.white,fontSize: 14),),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFF0798C6),
                  ),
                ):
                InkWell(
                  onTap:  (){
                    setState(() {
                      _option=1;
                    });
                  },
                  child: Container(
                    height: 29,
                    child:Center(child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text('Standard',style: TextStyle(color: Colors.white,fontSize: 14),),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ),
                _option==2? Container(
                  height: 29,
                  child:Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text('Advance',style: TextStyle(color: Colors.white,fontSize: 14),),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFF0798C6),
                  ),
                ):
                InkWell(
                  onTap:  (){
                    setState(() {
                      _option=2;
                    });
                  },
                  child: Container(
                    height: 29,
                    child:Center(child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text('Advance',style: TextStyle(color: Colors.white,fontSize: 14),),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ),
                _option==3? Container(
                  height: 29,
                  child:Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text('Expert',style: TextStyle(color: Colors.white,fontSize: 14),),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFF0798C6),
                  ),
                ):
                InkWell(
                  onTap:  (){
                    setState(() {
                      _option=3;
                    });
                  },
                  child: Container(
                    height: 29,
                    child:Center(child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text('Expert',style: TextStyle(color: Colors.white,fontSize: 14),),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ),
                _option==4? Container(
                  height: 29,
                  child:Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text('Pro',style: TextStyle(color: Colors.white,fontSize: 14),),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFF0798C6),
                  ),
                ):
                InkWell(
                  onTap:  (){
                    setState(() {
                      _option=4;
                    });
                  },
                  child: Container(
                    height: 29,
                    child:Center(child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text('Pro',style: TextStyle(color: Colors.white,fontSize: 14),),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Choose Gender',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
            ),
            SizedBox(height: 20,),
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
                      items: <String>['Male', 'Female'].map((String value) {
                        return DropdownMenuItem<String>(

                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                       // flag=1;
                        gender_type=1;
                        if(value=='Female'){

                          gendercheck=0;
                        }else{
                          gendercheck=1;
                        }
                        setState(() {
                          _select_gender=value;
                        });

                      },
                      value: _select_gender,
                    )

                ),
              ),
            ),
           Spacer(),
            Center(
              child: Container(
                height: 59,
                width: MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(
                ),
                child: RaisedButton(
                  color: blue,
                  child: const Text(
                    "Apply Filters",
                    style: TextStyle(color: Colors.white , fontSize: 16 ),
                  ),
                  onPressed: () {
                    if(first_type!=-1){
                      // first ste
                      print("herrr");
                      flagcheck=1;
                      if(_option!=-1){
                        //second set
                        flagcheck=2;
                        if(gender_type!=-1){
                          //third set
                          flagcheck=3;
                        }
                      }else if(gender_type!=-1){
                        //third set
                        flagcheck=4;
                      }

                    }else if(_option!=-1){
                      flagcheck=5;
                      if(first_type!=-1){
                        flagcheck=7;
                      }else if(gender_type!=-1){
                        //third set
                        flagcheck=8;
                      }
                      //if()
                    }else if(gender_type!=-1){
                      flagcheck=6;
                      if(first_type!=-1){
                        flagcheck=9;
                      }else if(_option!=-1){
                        //third set
                        flagcheck=10;
                      }
                    }

                  print("flagsss : "+flagcheck.toString());




                    if(flagcheck==3 || flagcheck==8 || flagcheck==10){
                      // teno ki functionality
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].trainer_type_id==first_type && trainers[i].level==_option && trainers[i].gender==gendercheck){
                        //  print("trainers[i].trainer_type_id :: "+trainers[i].trainer_type_id.toString());
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }
                    else if(flagcheck==2 || flagcheck==7){
                      flag=1;
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].trainer_type_id==first_type && trainers[i].level==_option){
                          //  print("trainers[i].trainer_type_id :: "+trainers[i].trainer_type_id.toString());
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }
                    else if(flagcheck==4 || flagcheck==9){
                      flag=1;
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].trainer_type_id==first_type && trainers[i].gender==gendercheck){
                          //  print("trainers[i].trainer_type_id :: "+trainers[i].trainer_type_id.toString());
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }
                    else if(flagcheck==1){
                      flag=1;
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].trainer_type_id==first_type){
                          extra.add(trainers[i]);

                        }
                      }
                    }else if(flagcheck==5){
                      flag=1;
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].level==_option){
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }
                    else if(flagcheck==6){
                      flag=1;
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].gender==gendercheck){
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }
                  /*  else if(flagcheck==4){
                      // type and gender selected
                    }
                    else if(flagcheck==2){
                      // type and choose
                    }
                    if(flagcheck==1)
                    {
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].trainer_type_id==first_type){
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }
                    if(flagcheck==6)
                    {
                      for(int i=0;i<trainers.length;i++){
                        if(trainers[i].gender==gendercheck){
                          extra.add(trainers[i]);
                          flag=1;
                        }
                      }
                    }*/
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen())).then((value) {
                      setState(() {


                        // totalnumbers
                        // refresh state
                      });
                    });
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
