import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/profile/profile_page.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/stats/statistic_page.dart';

import 'package:flutter/material.dart';

import '../../../utils/app_routes.dart';
import 'home/home_page.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<Widget> mWidgets = [
    HomePage(),
    StatisticPage(),
    Scaffold(),
    Scaffold(),
    ProfilePage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) {
          if(index==2){
            Navigator.pushNamed(context, AppRoutes.addExpense);
          } else {
            selectedIndex = index;
            setState(() {

            });
          }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.black26,),
                label: "Home",
                activeIcon: Icon(Icons.home, color: Colors.pink.shade200,)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined, color: Colors.black26,),
                label: "Stats",
                activeIcon: Icon(
                  Icons.bar_chart_outlined, color: Colors.pink.shade200,)),
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.pink.shade200,
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ), label: "Add"),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined, color: Colors.black26,),
              label: "Notifications",
              activeIcon: Icon(
                Icons.notifications_sharp, color: Colors.pink.shade200,),),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, color: Colors.black26,),
                label: "Profile",
              activeIcon: Icon(
                Icons.account_circle_rounded, color: Colors.pink.shade200,),
            ),
          ]),
    );
  }
}
