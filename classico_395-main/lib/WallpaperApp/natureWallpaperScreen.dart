import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NatureWallpaperScreen extends StatelessWidget{
  List<Map<String, dynamic>> wallpaperListData = [
    {
      "imgWall": "assets/images/wlp1.jpeg",
      "imgCategories": "assets/images/wlp4.jpeg",
      "textCategories": "Abstrack"
    },
    {
      "imgWall": "assets/images/wlp2.jpeg",
      "imgCategories": "assets/images/wlp3.jpeg",
      "textCategories": "Nature"
    },
    {
      "imgWall": "assets/images/wlp3.jpeg",
      "imgCategories": "assets/images/wlp2.jpeg",
      "textCategories": "Marine"
    },
    {
      "imgWall": "assets/images/wlp2.jpeg",
      "imgCategories": "assets/images/wlp3.jpeg",
      "textCategories": "Nature"
    },
    {
      "imgWall": "assets/images/wlp3.jpeg",
      "imgCategories": "assets/images/wlp2.jpeg",
      "textCategories": "Marine"
    },
    {
      "imgWall": "assets/images/wlp4.jpeg",
      "imgCategories": "assets/images/wlp1.jpeg",
      "textCategories": "Animals"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                EdgeInsets.only(left: 20, top: 60, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Nature",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    ),
                    Text(
                      "36 wallpaper available",
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 900,
                        width: double.infinity,
                        child: GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                mainAxisSpacing: 11,
                                crossAxisSpacing: 11,
                                childAspectRatio: 9 / 16),
                            itemCount: wallpaperListData.length,
                            itemBuilder: (_, index) {
                              return Container(
                                width: 500,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        wallpaperListData[index]
                                        ['imgCategories'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 300,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}