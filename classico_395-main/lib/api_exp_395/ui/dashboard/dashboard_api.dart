import 'dart:math';

import 'package:classico_395/api_exp_395/utils/app_routes.dart';
import 'package:flutter/material.dart';

class DashboardApi extends StatelessWidget {

  List<Map<String, dynamic>> apiPageData = [
    {
      "apiName" : "Recipe",
      "HomePage" : AppRoutes.homeRecipe
    },
    {
      "apiName" : "Quote",
      "HomePage" : AppRoutes.homeQuote
    },
    {
      "apiName" : "Product",
      "HomePage" : AppRoutes.homeProduct
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: apiPageData.length,
            itemBuilder: (_, index){
            return ListTile(
              onTap: (){
                Navigator.pushNamed(_,apiPageData[index]['HomePage']);
              },
              // leading: Text('${index+1}',style: TextStyle(fontSize: 30),),
              title: Text(apiPageData[index]['apiName']),
              // tileColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
              // textColor: Colors.white,
              style: ListTileStyle.drawer,
            );
            })
      )
    );
  }
}
