import 'dart:async';

import 'package:classico_395/navigation_exp_395/app_routes.dart';
import 'package:classico_395/navigation_exp_395/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

@override
  State<StatefulWidget> createState() => SplashPageState();

}



class SplashPageState extends State<SplashPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomePageNavigation()));

      Navigator.pushReplacementNamed(context, AppRoutes.HOMEPAGE);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 150,
            ),
            SizedBox(
              height: 11,
            ),
            Text("Classico",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
