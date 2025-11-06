import 'package:flutter/material.dart';

class HomeWallpaperScreen extends StatelessWidget {
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
      "imgWall": "assets/images/wlp4.jpeg",
      "imgCategories": "assets/images/wlp1.jpeg",
      "textCategories": "Animals"
    },
    {
      "imgWall": "assets/images/wlp4.jpeg",
      "imgCategories": "assets/images/wlp1.jpeg",
      "textCategories": "Animals"
    },
    {
      "imgWall": "assets/images/wlp2.jpeg",
      "imgCategories": "assets/images/wlp3.jpeg",
      "textCategories": "Nature"
    },

  ];

  List<dynamic> colorToneListData = [
    Colors.pink[200],
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.yellowAccent,
    Colors.brown,
    Colors.blueGrey,
    Colors.purpleAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabled: true,
                      hintText: "Find Wallpaper ...",
                      hintStyle: TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black38,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 25, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Best of the month",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: wallpaperListData.length,
                          itemBuilder: (_, index) {
                            print("Count wallpaperListData: $index");
                            return Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 200,
                                width: 130,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                      wallpaperListData[index]['imgWall'],
                                      fit: BoxFit.cover),
                                ));
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 25, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The color tone",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 45,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: colorToneListData.length,
                          itemBuilder: (_, index) {
                            print("Count ToneListData Data: $index");
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: colorToneListData[index]),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, top: 25, bottom: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    SingleChildScrollView(
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 500,
                          width: double.infinity,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      mainAxisSpacing: 11,
                                      crossAxisSpacing: 11,
                                      childAspectRatio: 16 / 9),
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
                                          height: double.infinity,
                                        ),
                                      ),
                                      Text(
                                        wallpaperListData[index]
                                            ['textCategories'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })),
                    ),
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
/*Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: wallpaperListData[index]
                                        ['imgCategories']
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      wallpaperListData[index]
                                          ['textCategories'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )*/
