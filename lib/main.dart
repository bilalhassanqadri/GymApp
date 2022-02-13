import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/Diet.dart';
import 'package:fitnessapp/Filter.dart';
import 'package:fitnessapp/bmr.dart';
import 'package:fitnessapp/bodyfat.dart';
import 'package:fitnessapp/generalhealth.dart';
import 'package:fitnessapp/goals.dart';
import 'package:fitnessapp/homescreen.dart';
import 'package:fitnessapp/lifestyle.dart';
import 'package:fitnessapp/macrocalculator.dart';
import 'package:fitnessapp/notifications.dart';
import 'package:fitnessapp/onboard.dart';
import 'package:fitnessapp/personalprofile.dart';
import 'package:fitnessapp/registerpge.dart';
import 'package:fitnessapp/resetpass.dart';
import 'package:fitnessapp/resetpassconfirm.dart';
import 'package:fitnessapp/result.dart';
import 'package:fitnessapp/settings.dart';
import 'package:fitnessapp/signin.dart';
import 'package:fitnessapp/tools.dart';
import 'package:fitnessapp/trainerprofile.dart';
import 'package:fitnessapp/trainingquestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DataFile.dart';
import 'EditProfile.dart';
import 'extrauserdetails/goal.dart';
import 'extrauserdetails/gender.dart';
import 'extrauserdetails/height.dart';
import 'extrauserdetails/birthdate.dart';

import 'extrauserdetails/weight.dart';

import 'extrauserdetails/exercisetime.dart';
import 'forgetPassword.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = 'pk_test_51J1dT8CuOSsU8OIypvdkQoNVCUwQ4m2Y1foVdikGwlj95xBJd6jUE5MArxnxJJWE45Jd5EaPJd89ecl1EGKWSYzu00vA5NlKX7';
  Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  var email=preferences.getString('email');
  SaveuserEmail=email;
  runApp(MaterialApp(
    home: email==null?Onbaord():Homescreen(),
    routes: {
      "Signin": (context) => Signin(),
      "Registerpage": (context) => Registerpage(),
      "Homescreen": (context) => Homescreen(),
      "Filters": (context) => Filters(),
      "Setings": (context) => Setings(),
      "Goals": (context) => Goals(),
      "GeneralHealth": (context) => GeneralHealth(),
      "TrainingQuestions": (context) => TrainingQuestions(),
      "LifeStyle": (context) => LifeStyle(),
      "Diet": (context) => Diet(),
      "Result": (context) => Result(),
      "Notifications": (context) => Notifications(),
      "Resetpass": (context) => Resetpass(),
      "Resetpassconfirm": (context) => Resetpassconfirm(),
      "Personalprofile": (context) => Personalprofile(),
      "Tools": (context) => Tools(),
      "Macro": (context) => Macro(),
      "BMR": (context) => BMR(),
      "BodyFat": (context) => BodyFat(),
      "Forgotpass":  (context) => Forgotpass(),
      "Goal": (context) => Goal(),
      "Gender": (context) => Gender(),
      "Birthdate": (context) => Birthdate(),
      "Height": (context) => Height(),
      "Weight": (context) => Weight(),
      "Excercisetime": (context) => Excercisetime(),
      "EditProfile": (context) => EditProfile(),

    },
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Fitness_app',
//       home: Onbaord(),
//       routes: {
//        "Signin": (context) => Signin(),
//        "Registerpage": (context) => Registerpage(),
//        "Homescreen": (context) => Homescreen(),
//        "Filters": (context) => Filters(),
//        "Setings": (context) => Setings(),
//        "Goals": (context) => Goals(),
//        "GeneralHealth": (context) => GeneralHealth(),
//        "TrainingQuestions": (context) => TrainingQuestions(),
//        "LifeStyle": (context) => LifeStyle(),
//        "Diet": (context) => Diet(),
//        "Result": (context) => Result(),
//        "Notifications": (context) => Notifications(),
//        "Resetpass": (context) => Resetpass(),
//        "Resetpassconfirm": (context) => Resetpassconfirm(),
//        "Personalprofile": (context) => Personalprofile(),
//        "Tools": (context) => Tools(),
//        "Macro": (context) => Macro(),
//        "BMR": (context) => BMR(),
//        "BodyFat": (context) => BodyFat(),
//
//         "Goal": (context) => Goal(),
//         "Gender": (context) => Gender(),
//         "Birthdate": (context) => Birthdate(),
//         "Height": (context) => Height(),
//         "Weight": (context) => Weight(),
//         "Excercisetime": (context) => Excercisetime(),
//
//       },
//
//     );
//   }
// }



