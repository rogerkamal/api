
import 'dart:async';

import 'package:classico_395/Sharedprefs_395/task20062025/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashtask20062025 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Splashtask20062025State();
}

class Splashtask20062025State extends State<Splashtask20062025>{

  SharedPreferences? prefs;
  bool loginFlag = false;
  String loginFlagKey = "loginFlagKey";

  @override
  void initState() {
    super.initState();
    initPrefs();

    Timer(Duration(seconds: 2), (){
      loginFlag == true ?
      Navigator.pushReplacementNamed(context, AppRoutes.HOME):
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN) ;
    });



  }

  initPrefs() async{
    prefs = await SharedPreferences.getInstance();

    //get data from SharedPrefs
    loginFlag = prefs!.getBool(loginFlagKey) ?? false;

/*    //set Data from SharedPrefs
    prefs!.setBool(loginFlagKey, loginFlag);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("This is Splash Page"),
            FlutterLogo(size: 40,)
          ],
        ),
      ),
    );
  }
}