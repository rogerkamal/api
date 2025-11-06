import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Practice19062025SharedPref extends StatefulWidget {
  @override
  State<Practice19062025SharedPref> createState() => _Practice19062025SharedPrefState();
}

class _Practice19062025SharedPrefState extends State<Practice19062025SharedPref> {
  TextEditingController nameController = TextEditingController();

  SharedPreferences? prefs;
/*  String name = "";
  String nameKey = "name";*/
  int count = 0;
  String keyCounter = "counter";

  @override
  initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async{
    prefs = await SharedPreferences.getInstance();

    getDataFromPrefs();
  }

  void getDataFromPrefs(){
    // name = prefs!.getString(nameKey) ?? "Default value";
    count = prefs!.getInt(keyCounter) ?? 0;
    count ++;
    prefs!.setInt(keyCounter, count);
    setState(() {

    });
  }

  /*void setNameToPrefs({required String name}){
    prefs!.setString(nameKey, name);
    prefs!.setInt("age", 16);
  }*/


  void setDataToPrefs({required int count}){
    prefs!.setInt(keyCounter, count);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPrefs'),
      ),
      body: Center(

        child: Container(margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No. of times you've open the app ", style: TextStyle(fontSize: 20),),
              Text("$count", style: TextStyle(fontSize: 200,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );

  }
}