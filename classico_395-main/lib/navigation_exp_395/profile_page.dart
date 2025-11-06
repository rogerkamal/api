import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  /*/// get data from one page (screen) to another by simple navigation
  final String data;
  const ProfilePage({super.key, required this.data});*/




  @override
  Widget build(BuildContext context) {
    /// as used when data is accessed from one page to another by named navigation
    final String data = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),),

              SizedBox(height: 11,),
              Text("This is accessing data from previous page :\n$data",
              style: TextStyle(color: Colors.red,fontSize: 25),),
              SizedBox(height: 11,),

              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Icon(Icons.arrow_back_ios)),


            ],
          ),
        ),
      ),
    );
  }
}
