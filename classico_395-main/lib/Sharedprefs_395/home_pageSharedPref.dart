import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageSharedPref extends StatefulWidget {
  @override
  State<HomePageSharedPref> createState() => _HomePageSharedPrefState();
}

class _HomePageSharedPrefState extends State<HomePageSharedPref> {
  TextEditingController nameController = TextEditingController();

  SharedPreferences? prefs;
  String name = "";
  String nameKey = "name";


  @override
  initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    getNameFromPrefs();
  }

  void getNameFromPrefs(){
    name = prefs!.getString(nameKey) ?? "Default value";
    setState(() {

    });
  }

  void setNameToPrefs({required String name}){
    prefs!.setString(nameKey, name);
    prefs!.setInt("age", 16);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Text("Welcome $name", style: TextStyle(fontSize: 20),),
          SizedBox(
            height: 11,
          ),
          TextField(
            controller: nameController,
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: (){
            setNameToPrefs(name: nameController.text);
          }, child: Text('Save'))
        ],
      ),
    );
  }
}
