import 'package:fitnessapp/DataFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:http/http.dart' as http;
import 'color.dart';

//Gender
class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _genderState createState() => _genderState();
}

class _genderState extends State<EditProfile> {
  int selected = 0;
  String _date = Born;
  final dateController = TextEditingController();
  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final _weigth = TextEditingController()..text=Weights;
  final _height = TextEditingController()..text=Tall;
  final _name= TextEditingController()..text=Name;
String gender='';
  Future<String> UpdateProfile()async{
    print(userID);
    print("yes");
    if(selected==1){
      gender="Male";
    }else{
      gender="Female";
    }
    final response = await http.post(Uri.parse(URL+'eidituser.php'), body: {
      "name" :_name.text.toString(),
      "gender" : gender,
      'dob' : _date,
      'tall' : _height.text.toString(),
      'weight' : _weigth.text.toString(),


      "userid":userID.toString(),
    });
    //  print("asd");
    String data;
    print (response.statusCode);
    if (response.statusCode == 200) {
      //  data = json.decode(response.body);
      Name=_name.text;
      Genders=gender;
      Born=_date;
      Tall=_height.text;
      Weights=_weigth.text;
      return "ok";
    }
    else{
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Genders=='Female'){
      selected=2;
      gender="Female";
    }else{
      gender="Male";
      selected=1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Edit Profile',style: TextStyle(color: blue,fontSize: 22),),
        leading: InkWell(child: Icon(Icons.arrow_back_ios,color: blue,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('What is your gender?', style:
                    TextStyle(
                        fontSize: 24, fontWeight:  FontWeight.w600
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selected ==1 ?  Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width/2.7,
                          child: RaisedButton(
                            color: blue ,
                            onPressed: () {
                              setState(() {
                                selected =1;
                              });
                              // Navigator.pushNamed(context, 'Password');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "MALE",
                              style: TextStyle(
                                  fontSize: 22,
                                  color:
                                  selected ==1?Colors.white:Colors.black.withOpacity(0.6).withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ):
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width/2.7,
                          child: RaisedButton(
                            color: Colors.white.withOpacity(0.6) ,
                            onPressed: () {
                              setState(() {
                                selected =1;
                              });
                              // Navigator.pushNamed(context, 'Password');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "MALE",
                              style: TextStyle(
                                  fontSize: 22,
                                  color:
                                  Colors.black.withOpacity(0.6).withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        selected ==2?
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width/2.7,
                          child: RaisedButton(
                            color: blue ,
                            onPressed: () {
                              setState(() {
                                selected =2;
                              });
                              //  Navigator.pushNamed(context, 'Password');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "FEMALE",
                              style: TextStyle(
                                  fontSize: 22,
                                  color:
                                  selected ==2?Colors.white:Colors.black.withOpacity(0.6).withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ):Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width/2.7,
                          child: RaisedButton(
                            color: Colors.white.withOpacity(0.6),
                            onPressed: () {
                              setState(() {
                                selected =2;                                      });
                              //  Navigator.pushNamed(context, 'Password');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "FEMALE",
                              style: TextStyle(
                                  fontSize: 22,
                                  color:
                                  Colors.black.withOpacity(0.6).withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Please Enter Your Date of Birth', style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
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





                    Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text('Your Name', style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white.withOpacity(0.5)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: _name,
                              keyboardType: TextInputType.text,
                              //   controller: dateController,
                              decoration: InputDecoration(
                                hintText: 'Please Enter Your Height',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),

                                ),
                                filled: true,
                              ),
                            ),
                          ),


                          SizedBox(
                            height: 20,
                          ),
                          Text('Weight', style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white.withOpacity(0.5)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: _weigth,
                              keyboardType: TextInputType.number,
                              //   controller: dateController,
                              decoration: InputDecoration(
                                hintText: 'Please Enter Your Weight',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),

                                ),
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Height', style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white.withOpacity(0.5)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: _height,
                              keyboardType: TextInputType.number,
                              //   controller: dateController,
                              decoration: InputDecoration(
                                hintText: 'Please Enter Your Height',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),

                                ),
                                filled: true,
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
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
                              "Update",
                              style: TextStyle(color: Colors.white , fontSize: 16 ),
                            ),
                            progressWidget: const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                            onPressed: () async{
                              if (formkey.currentState.validate()){
                               String ans=await UpdateProfile();
                               if(ans=="ok"){
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data has been Updated successfully" )));
                                 Navigator.pop(context);
                               }


                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
          ),
          ),




    );
  }
}
