import 'package:classico_395/multi_step_forms/multi_step_form.dart';
import 'package:flutter/material.dart';

main(){
runApp(MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "MultiStep Form",
     debugShowCheckedModeBanner: true,
     themeMode: ThemeMode.dark,

     home: MultiStepForm(),
   );

  }
}