import 'package:classico_395/api_comments/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "api_comments",
     home: HomePageApiComments(),
   );
  }


}