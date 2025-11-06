
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePagetask20062025 extends StatefulWidget{
  @override
  State<HomePagetask20062025> createState() => _HomePagetask20062025State();
}

class _HomePagetask20062025State extends State<HomePagetask20062025> {

  SharedPreferences? prefs;
  bool loginFlag = false;
  String loginFlagKey = "loginFlagKey";


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs();
}

  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text("Welcome! Successfully logged in",style: TextStyle(fontSize: 25),),
          ),
          TextButton(onPressed: () async {
            //set data to sharedprefs
            prefs!.setBool(loginFlagKey, false);
            await prefs!.clear(); // remove all stored session data

            Navigator.pop(context);
          }, child: Text("Log out"))
        ],
      ),
    );
  }
}