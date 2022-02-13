import 'package:flutter/material.dart';

import 'Modles/Trainers.dart';

String URL="https://syskosoft.com/fitness/apis/";

String SaveuserEmail="";

String ExtraEmailforLogin="";
String EXtraPasswordForLogin;
int alreadySaveData=0;
int mycase=0;
int UpdateGoal=1;
//user Data

String Name;
String Emails;
String SigninType;
String userID;

String Goalls;
String Genders;
String Born;
String Tall;
String TallUnit;
String Weights;
String WeightUnit;
double ExDays;


/// Filters
List<Trainers> extra = [];
int totalnumbers=-1;
int first_type=-1;
int flag=-1;
int gendercheck=-1;
int gender_type=-1;
int choose_type=-1;


// Goals and prefrences variables
// Goals
String f1;
String f2;
String f3;
//Diet
String f4;
String f5;
String f6;
String f7;
String f8;

// general health

String f9;
String f10;
String f11;

// training
String f12;
String f13;
String f14;
String f15;

// Life Style
String f16;
String f17;
String f18;
String f19;
String f20;

// check Pay Button or not

int whichbutton=0;

int trainerID=-1;

bool isSelected = false;