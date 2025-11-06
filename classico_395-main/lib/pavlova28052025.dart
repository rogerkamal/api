import 'package:flutter/material.dart';

class PavlovaUI extends StatelessWidget {
  const PavlovaUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          title: Center(
              child: Text(
            "Pavlova",
            style: TextStyle(fontSize: 30),
          )),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 400,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 4,color: Colors.greenAccent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "Strawberry Pavlova",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xD0E2EBFF),
                                border: Border.all(width: 1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                                "Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova. Pavlova featues a crisp crust and soft, light inside, topped with fruit and whipped cream.",
                                style: TextStyle(fontSize: 11),
                                textAlign: TextAlign.center),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xD0E2EBFF),
                                border: Border.all(width: 1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xD0E2EBFF),
                                border: Border.all(width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text("170 Reviews")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(

                            width: double.infinity,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xD0E2EBFF),
                                border: Border.all(width: 1)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.book_outlined,color: Colors.green,),
                                      Text("PREP:",
                                        style: TextStyle(fontSize: 15),),
                                      SizedBox(height: 10),
                                      Text("25 min",style:
                                        TextStyle(fontSize: 15),)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.timer_outlined,color: Colors.green,),
                                      Text("COOK:",
                                        style: TextStyle(fontSize: 15),),
                                      SizedBox(height: 10),
                                      Text("1 hr",style:
                                      TextStyle(fontSize: 15),)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.restaurant,color: Colors.green,),
                                      Text("FEEDS:",
                                        style: TextStyle(fontSize: 15),),
                                      SizedBox(height: 10),
                                      Text("4-6",style:
                                      TextStyle(fontSize: 15),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Image.asset(
                "assets/images/pavlova_bg.png",
                height: 460,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}
