
import 'package:flutter/material.dart';

class ViewWallpaperScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset("assets/images/wlp1.jpeg", fit: BoxFit.cover,)),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white30,
                        ),
                        child: Icon(Icons.info_outlined),
                      ),
                      Text("Info",style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white30,
                        ),
                        child: Icon(Icons.save_alt_rounded),
                      ),
                      Text("Save",style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.brush_rounded,color: Colors.white,),
                      ),
                      Text("Apply",style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}