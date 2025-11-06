import 'package:classico_395/Sharedprefs_395/task20062025/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPagetask20062025 extends StatefulWidget {




  @override
  State<StatefulWidget> createState() => LoginPagetask20062025State();
}

class LoginPagetask20062025State extends State<LoginPagetask20062025>{

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("This is Login Page",style: TextStyle(fontSize: 20),),
            TextButton(onPressed: () {
              //set data to sharedprefs
              prefs!.setBool(loginFlagKey, true);

              Navigator.pushNamed(context, AppRoutes.HOME);
            }, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
