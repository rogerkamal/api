import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task20062025 extends StatefulWidget {
  @override
  State<Task20062025> createState() => _Task20062025State();
}

class _Task20062025State extends State<Task20062025> {
  TextEditingController nameController = TextEditingController();

  SharedPreferences? prefs;
  String name = "";
  int count  = 0;
  String nameKey = "name";
  String countKey = "count";
  Color bgColor = Colors.black;

  @override
  initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    getNameFromPrefs();
    updateCount();
  }

  updateCount(){
    count = prefs!.getInt(countKey) ?? 0;
    count++;
    prefs!.setInt(countKey, count);
    if(count%3 == 0&&count%5 == 0){
      bgColor = Colors.orange;
    } else if(count%5 == 0){
      bgColor = Colors.blue;
    } else if(count%3 == 0){
      bgColor = Colors.green;
    }
    setState(() {});
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
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(child: Text("$count", style: TextStyle(fontSize: 100, color: Colors.white38),)),
          ),
          Column(
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
        ],
      ),
    );
  }
}
