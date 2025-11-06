import 'package:classico_395/db_exp_395/home_pageDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

void main(){
  runApp(MaterialApp(
    title: "db practice",
    home: HomePageDB(),
  ));
}



/*
void main(){
  runApp(ScreenUtilInit(
    designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context)!.size.height),
    builder: (context, child) {
      return MaterialApp(
        title: "db practice",
        home: child,
      );
    },
    child: HomePageDB(),
  ));
}*/
