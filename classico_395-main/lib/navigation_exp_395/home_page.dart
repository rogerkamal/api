import 'package:classico_395/navigation_exp_395/app_routes.dart';
import 'package:classico_395/navigation_exp_395/profile_page.dart';
import 'package:flutter/material.dart';

class HomePageNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade400,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home'),
            ElevatedButton(
                onPressed: () {
                  /*/// simple navigation
                   Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));*/

                  /*/// named navigation
                  Navigator.pushNamed(context, AppRoutes.PROFILEPAGE);*/

                  /// carry data from one page (screen) to another by named navigation with arguments
                  Navigator.pushNamed(context, AppRoutes.PROFILEPAGE, arguments: "Data of Home Page ");

                  /*/// carry data from one page (screen) to another by simple navigation
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>ProfilePage(data : 'Hello from First Page')));*/


                  /*///send multiple data using Map
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        data: {
                          "title": "Do Homework",
                          "isCompleted": 0,
                        },
                      ),
                    ),
                  );*/
                },
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
