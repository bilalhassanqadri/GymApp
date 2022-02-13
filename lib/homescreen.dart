import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/color.dart';
import 'package:fitnessapp/search.dart';
import 'package:fitnessapp/settings.dart';
import 'package:fitnessapp/tools.dart';
import 'package:fitnessapp/trainerprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import 'DataFile.dart';
import 'Modles/Trainers.dart';
import 'Modles/TrainersType.dart';
class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List datas;
  Future<String> LoginUser(String emails) async {
    final response = await http.post(Uri.parse(URL+'saveuser.php'), body: {
      "email":emails.toString(),
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
  Future<String> st;
  List data;
  Future<String> getTrainers() async {
    if(SaveuserEmail!=null)
      await LoginUser(SaveuserEmail);
    if (trainers.length != 0)
      return "";
   /* final response = await http.get(
        Uri.parse(URL + 'gettrainers.php'));*/
    final response = await http.post(Uri.parse(URL+'gettrainers.php'), body: {
      "id":userID.toString(),
    });
    if (response.statusCode == 200){
      data = json.decode(response.body);
      for(int i=0;i<data.length;i++){

        if(data[i]=='Trainers')
        {
          ++i;
          trainers.add(Trainers(id: int.parse(data[i]["id"]),name:data[i]["name"],level:int.parse(data[i]["expert"]),image: data[i]["image"],back_image:data[i]["back_image"],gender: int.parse(data[i]["gender"])
              ,trainer_type_id: int.parse(data[i]["trainer_type_id"]) ,available_slos: int.parse(data[i]["available_slos"])
              ,Trainer_rating: double.parse(data[i]["Trainer_rating"]),email:data[i]["email"],experience: int.parse(data[i]["experience"])
              ,Qualification:data[i]["Qualification"],Intrests:data[i]["Intrests"],training_at:data[i]["training_at"]
              ,insta_link:data[i]["insta_link"],about_trainer:data[i]["about_trainer"]
          )
          );
          // precacheImage(data[i]["url"], context);
        }
        if(data[i]=='TrainerType')
        {
          ++i;
          trainertype.add(TrainerType(id: int.parse(data[i]["id"]),type: data[i]["type"],image_url: data[i]["image_url"]));
          // precacheImage(data[i]["url"], context);
        }
        if(data[i]=='GoalsnPrefrence')
        {
          ++i;
          //trainertype.add(TrainerType(id: int.parse(data[i]["id"]),type: data[i]["type"],image_url: data[i]["image_url"]));
          // precacheImage(data[i]["url"], context);

          f1=data[i]["whytraining"];
          f2=data[i]["shorttermfitnessgoal"];
          f3=data[i]["Longtermfitnessgoal"];
          f4=data[i]["Diet"];
          f5=data[i]["Mealsaday"];
          f6=data[i]["Foodallergies"];
          f7=data[i]["Seuplements"];
          f8=data[i]["Calories"];
          f9=data[i]["DoctorPermission"];
          f10=data[i]["Medicalhistory"];
          f11=data[i]["sideeffects"];
          f12=data[i]["Typeofexercise"];
          f13=data[i]["RecentAction"];
          f14=data[i]["Workedwithtrainer"];
          f15=data[i]["Previousinjuries"];
          f16=data[i]["Living"];
          f17=data[i]["Sleepinaday"];
          f18=data[i]["Drinkoften"];
          f19=data[i]["Smokeoften"];
          f20=data[i]["Discount"];
          if(f20!="")
            alreadySaveData=1;

        }else{
          print('f20');
          f20="";
        }
      }
      return "Success";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
print("flag == "+flag.toString());
    setState(() {
      st=getTrainers();
    });
  }
  @override
  int _selectedIndex = 0;
  bool _enabled = true;
  Future<bool> _onbackpressed(){
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title:  Text("do you really wanna exit? "),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text("yes"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text("no"),
                  onPressed: () {
                    Navigator.pop(context,false);
                  },
                )
              ],
            ));
  }
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return WillPopScope(
      onWillPop: _onbackpressed,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex==0?
              Image.asset('assets/iconblue1.png',
                height: 25,
                width: 25,
              ):Image.asset('assets/icon1.png',
                height: 25,
                width: 25,),
              label: '',

            ),
            BottomNavigationBarItem(
                icon: _selectedIndex==1?
                Image.asset('assets/iconblue2.png',
                  height: 25,
                  width: 25,):Image.asset('assets/icon2.png',
                  height: 25,
                  width: 25,),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: _selectedIndex==2?
                Image.asset('assets/iconblue3.png',
                  height: 25,
                  width: 25,):Image.asset('assets/icon3.png',
                  height: 25,
                  width: 25,),
                label: ''
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow,
          onTap: (index){
            //print(index);
            setState(() {
              _selectedIndex=index;
            });
          },
        ),
        body: SafeArea(
          child: _selectedIndex == 0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Find Your Trainer',style: TextStyle(fontWeight: FontWeight.bold,color: blue,fontSize: 26),),
              ),
              SizedBox(height: 20,),
              FutureBuilder<String>(
                  future: st,
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width/1.5,
                              child: TextFormField(
                                keyboardType: TextInputType.none,
                                  textAlignVertical: TextAlignVertical.center,
                                //textAlign: TextAlign.justify,
                                onTap: (){
                                  showSearch(context: context, delegate: DataSearch(context: context));
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
                                  suffixIcon: Icon(Icons.search,size: 25,),
                                  contentPadding: EdgeInsets.only(left: 10,top: 0,bottom: 0),
                                  hintText: 'Search',
                                ),


                              ),
                            ),
                            InkWell(
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width/4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Filter',style: TextStyle(color: border,fontSize: 14),),
                                    Icon(Icons.filter_list,size: 25,color: border,)
                                  ],
                                ),
                                decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: border)
                                ),
                              ),
                              onTap: (){
                                gender_type=-1;
                                gendercheck=-1;
                                first_type=-1;
                                flag=-1;
                                Navigator.pushNamed(context, 'Filters');
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Matches',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),),
                        ),
                        SizedBox(height: 20,),
                      ],
                      );
              else return Shimmer.fromColors(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container( height: 40,
                              width: MediaQuery.of(context).size.width/1.5,
                            ),
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container( height: 40,
                              width: MediaQuery.of(context).size.width/1.5,
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      enabled: _enabled,

                    );
              }
              ),


              FutureBuilder<String>(
              future: st,
              builder: (context, snapshot) {
              if (snapshot.hasData)
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: GridView.builder(
                    itemCount: flag==-1?trainers.length:extra.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 22, mainAxisSpacing: 4, childAspectRatio: 2 / 2.5),
                    controller: new ScrollController(keepScrollOffset: false),

                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      print("length == "+trainers.length.toString());
                      return InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 146,
                              width:202,
                              child: CachedNetworkImage(
                                imageUrl: flag==-1?trainers[index].image:extra[index].image,
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,

                                       ),
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 146,
                                  width:202,
                                  child: Shimmer.fromColors(
                                    child: Container(decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                      height: 146,
                                      width:202,),
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: _enabled,

                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),

                                Text(flag==-1?trainers[index].name:extra[index].name,style: TextStyle(color: Colors.black,fontSize: 14),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(flag==-1?trainertype[trainertype.indexWhere((element) => element.id==trainers[index].trainer_type_id)].type:trainertype[trainertype.indexWhere((element) => element.id==extra[index].trainer_type_id)].type,style: TextStyle(color: border,fontSize: 9),),
                                    Row(
                                      children: [
                                        Text(flag==-1?trainers[index].Trainer_rating.toString():extra[index].Trainer_rating.toString(),style: TextStyle(color: border,fontSize: 9),),
                                        Icon(Icons.star,color: Colors.yellow,),
                                      ],
                                    )
                                  ],
                                ),

                                Text(flag==-1?'Available Slots : '+trainers[index].available_slos.toString():'Available Slots : '+extra[index].available_slos.toString(),style: TextStyle(color: border,fontSize: 10),),
                              ],
                            )
                          ],
                        ),
                        onTap: (){
                          mycase=1;
                          trainerID=trainers[index].id;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Trainerprofile(trainers[index])),
                          );
                         // Navigator.pushNamed(context, 'Trainerprofile');
                        },
                      );
                    },
                  ),
                ),
              );
      else return Center(child: Center(child: CircularProgressIndicator()));
      }
              ),
            ],
          ):_selectedIndex==1?Tools():_selectedIndex==2?Setings():Container(),
        ),
      ),
    );
  }
}
